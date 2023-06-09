package com.zzk.client.clientServe;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @description:
 * @program: nettyTestDemo
 * @author: zzk
 * @created: 2021/12/04 19:02
 */
@Component
public class EncoderHandler extends MessageToByteEncoder {
    private static final Logger logger = LoggerFactory.getLogger(EncoderHandler.class);
    protected void encode(ChannelHandlerContext ctx, Object msg, ByteBuf out) throws Exception {

            TcpProtocol protocol = new TcpProtocol ();
            out.writeByte(protocol.getHeader1());
            out.writeByte(protocol.getHeader2());
            out.writeByte (((byte[])msg).length);
            out.writeBytes((byte[]) msg);
            out.writeByte(protocol.getTail1());
            out.writeByte(protocol.getTail2());
            logger.debug("数据编码成功："+out);

    }
}
