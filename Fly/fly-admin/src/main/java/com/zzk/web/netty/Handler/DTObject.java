package com.zzk.web.netty.Handler;

import lombok.Data;

/**
 * @description: 解决办法是将传输的对象进行二次包装，将全名类信息包含进去：
 * @program: nettyTestDemo
 * @author: zzk
 * @created: 2021/12/04 19:08
 */
@Data
public class DTObject {
    private String className;
    private byte[] object;
}
