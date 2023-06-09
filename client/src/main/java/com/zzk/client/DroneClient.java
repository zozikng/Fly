package com.zzk.client;

import com.zzk.client.clientServe.ClientHeartbeatHandler;
import com.zzk.client.clientServe.DecoderHandler;
import com.zzk.client.clientServe.EchoHandler;
import com.zzk.client.clientServe.EncoderHandler;
import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.logging.LoggingHandler;
import io.netty.handler.timeout.IdleStateHandler;

public class DroneClient {

    private String ip;
    private int port;
    public  void init() throws InterruptedException {
        NioEventLoopGroup group = new NioEventLoopGroup();
        try {
            Bootstrap bootstrap = new Bootstrap();
            bootstrap.group(group);
            bootstrap.channel(NioSocketChannel.class);
            bootstrap.option(ChannelOption.SO_KEEPALIVE,true);
            bootstrap.handler(new ChannelInitializer() {
                @Override
                protected void initChannel(Channel ch) throws Exception {
                    ch.pipeline().addLast("logging",new LoggingHandler ("DEBUG"));
                    ch.pipeline().addLast("ping",new IdleStateHandler (0, 0, 10));
                    ch.pipeline ().addLast ("decode",new DecoderHandler ());
                    ch.pipeline ().addLast ("encode",new EncoderHandler ());
                    ch.pipeline ().addLast ("handler",new EchoHandler ());
                    ch.pipeline().addLast("heartbeat",new ClientHeartbeatHandler ());
                }
            });
            bootstrap.remoteAddress(ip,port);
            ChannelFuture future = bootstrap.connect().sync();

            future.channel().closeFuture().sync();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            group.shutdownGracefully().sync();
        }
    }

    public DroneClient(String ip, int port) {
        this.ip = ip;
        this.port = port;
    }

    public static void main(String[] args) throws InterruptedException {
        new DroneClient ("43.139.150.149",8888).init();
    }
}
