package com.zzk.web.netty.Handler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @description: Tcp协议
 * @program: nettyTestDemo
 * @author: zzk
 * @created: 2021/12/04 19:03
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TcpProtocol {
    /**
     * 起始位
     */
    private byte header1=0x77;
    private byte header2=0x77;
    /**
     * 包长度
     */
    private byte len;
    /**
     * 协议号
     * 0x01：登录信息包
     * 0x02：定位数据包
     * 0x03: 心跳数据包
     */
    //private byte protocol;
    /**
     * 数据
     */
    private byte [] data;
    /**
     * 停止位
     */
    private byte tail1=0x0D;
    private byte tail2=0x0A;


}
