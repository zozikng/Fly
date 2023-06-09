package com.zzk.client.clientServe;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;

import static io.netty.handler.codec.dns.DnsRecordType.A;

public class ClientHeartbeatHandler extends CustomHeartbeatHandler {
    public ClientHeartbeatHandler() {
        super("server");
    }

    @Override
    protected void handleData(ChannelHandlerContext channelHandlerContext, ByteBuf byteBuf) {
    }

    @Override
    protected void handleReaderIdle(ChannelHandlerContext ctx) {
        super.handleReaderIdle(ctx);
        System.err.println("---client " + ctx.channel().remoteAddress().toString() + " reader timeout, close it---");
        ctx.close();
    }

    @Override
    protected void handleAllIdle(ChannelHandlerContext ctx) {
        byte[] data = new byte[]{0x03,0x00,0x40,0x04,0x00,0x00,0x00,0x01, (byte) 0x8C, (byte) 0xDD};
        ctx.writeAndFlush (data);
        super.handleAllIdle (ctx);
    }
}
