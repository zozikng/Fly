package com.zzk.web.netty.Handler;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @description:
 * @program: nettyTestDemo
 * @author: zzk
 * @created: 2021/12/04 19:04
 */
@Component
public class DecoderHandler extends ByteToMessageDecoder {
    //最小的数据长度：开头标准位1字节
    private static int MIN_DATA_LEN=6;
    //数据解码协议的开始标志
    private static byte PROTOCOL_HEADER_1=0x77;
    private static byte PROTOCOL_HEADER_2=0x77;
    //数据解码协议的结束标志
    private static byte PROTOCOL_TAIL_1=0x0D;
    private static byte PROTOCOL_TAIL_2=0x0A;
    private static final Logger logger = LoggerFactory.getLogger(DecoderHandler.class);
    protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
        if (in.readableBytes()>MIN_DATA_LEN){
            logger.debug("开始解码数据……");
            //标记读操作的指针
            in.markReaderIndex();
            byte header1=in.readByte();
            byte header2=in.readByte();
            if (header1==PROTOCOL_HEADER_1 && header2==PROTOCOL_HEADER_2){
                logger.debug("数据开头格式正确");
                //读取字节数据的长度
                long len=ByteUtils.byteHEX2IntDEC (in.readByte ());
                logger.debug ("数据长度为："+len);
                //数据可读长度必须要大于len，因为结尾还有一字节的解释标志位
                if (len>=in.readableBytes()){
                    logger.debug(String.format("数据长度不够，数据协议len长度为：%1$d,数据包实际可读内容为：%2$d正在等待处理拆包……",len,in.readableBytes()));
                    in.resetReaderIndex();
                    /*
                     **结束解码，这种情况说明数据没有到齐，在父类ByteToMessageDecoder的callDecode中会对out和in进行判断
                     * 如果in里面还有可读内容即in.isReadable为true,cumulation中的内容会进行保留，，直到下一次数据到来，将两帧的数据合并起来，再解码。
                     * 以此解决拆包问题
                     */
                    return;
                }
                byte [] data=new byte[(int) len];
                in.readBytes(data);//读取核心的数据
                byte tail1=in.readByte();
                byte tail2=in.readByte();
                if (tail1==PROTOCOL_TAIL_1&&tail2==PROTOCOL_TAIL_2){
                    logger.debug("数据解码成功");
                    out.add(data);
                    //如果out有值，且in仍然可读，将继续调用decode方法再次解码in中的内容，以此解决粘包问题
                }else {
                    logger.debug(String.format("数据解码协议结束标志位:%1$d [错误!]，期待的结束标志位是：%2$d",tail1+" "+tail2,PROTOCOL_TAIL_1+" "+PROTOCOL_HEADER_2));
                    return;
                }
            }else {
                logger.debug("开头不对，可能不是期待的客服端发送的数，将自动略过这一个字节");
            }
        }else {
            logger.debug("数据长度不符合要求，期待最小长度是："+MIN_DATA_LEN+" 字节");
            return;
        }
    }
}


