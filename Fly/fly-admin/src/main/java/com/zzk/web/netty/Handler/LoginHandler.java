package com.zzk.web.netty.Handler;

import com.zzk.common.constant.CacheConstants;
import com.zzk.common.core.redis.RedisCache;
import com.zzk.system.service.fly.IDroneListService;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.net.InetSocketAddress;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

/**
 * @description: 登录的handler
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/16 16:43
 */
@Component
public class LoginHandler extends ChannelInboundHandlerAdapter {


    @Autowired
    private RedisCache redisCache;

    @Autowired
    private IDroneListService droneListService;

    private static LoginHandler loginHandler;

    private static final Logger logger = LoggerFactory.getLogger(LoginHandler.class);
    /**
     * 通过注解@PostConstruct ，在初始化的时候初始化静态对象和它的静态成员变量Service，原理是拿到service层bean对象，静态存储下来，防止被释放。
     */
    @PostConstruct //通过@PostConstruct实现初始化bean之前进行的操作
    public void init() {
        loginHandler = this;
        loginHandler.redisCache = this.redisCache;
        loginHandler.droneListService = this.droneListService;
        // 初使化时将已静态化的testService实例化
    }

    /**
     * 注册
     *
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        super.channelRegistered (ctx);
    }

    /**
     * 注销
     *
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        super.channelUnregistered (ctx);
    }

    /**
     * 第一次连接
     *
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        super.channelActive (ctx);
    }

    /**
     * 连接断开的时候
     * 解除登录
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        String droneLoginkey = CacheConstants.DRONE_LOGIN_key + ((InetSocketAddress) ctx.channel ().remoteAddress ()).toString ();
        if (loginHandler.redisCache.hasKey (droneLoginkey)) {
            loginHandler.redisCache.deleteObject (droneLoginkey);
            logger.debug ("无人机:"+((InetSocketAddress) ctx.channel ().remoteAddress ()).toString ()+",已经下线");
        }
        super.channelInactive (ctx);
    }


    /**
     * 读取到数据
     * 无人机登录
     * 检测无人机id，和北斗卡id是否存在
     *
     * @param ctx
     * @param msg
     * @throws Exception
     */
    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        byte[] loginMsg = (byte[]) msg;
        if (loginMsg[0] == 0x01) {
            if (loginMsg.length == 18) {
                //解析飞行器id
                byte[] droneIdByte = ByteUtils.subBytes (loginMsg, 1, 8);
                //解析北斗卡号
                byte[] cardIdByte = ByteUtils.subBytes (loginMsg, 9, 5);
                String droneId = ByteUtils.bytes2HexString (droneIdByte);
                String cardId = ByteUtils.byteHEX2StringDEC (cardIdByte);
                String droneLoginkey = CacheConstants.DRONE_LOGIN_key + ((InetSocketAddress) ctx.channel ().remoteAddress ()).toString ();
                HashMap map = new HashMap ();
                map.put ("droneId", droneId);
                map.put ("cardId", cardId);

                if (!loginHandler.redisCache.hasKey (droneLoginkey) && loginHandler.droneListService.existsDrone (droneId, cardId)) {
                    loginHandler.redisCache.setCacheMap (droneLoginkey, map);
                    loginHandler.redisCache.expire (droneLoginkey, 7, TimeUnit.DAYS);
                    logger.debug ("无人机:"+((InetSocketAddress) ctx.channel ().remoteAddress ()).toString ()+",已经登录成功");
                }
            }

            ctx.writeAndFlush (msg);
        } else {
            ctx.fireChannelRead (msg);
        }

    }

    /**
     * 读取完数据
     *
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        super.channelReadComplete (ctx);
    }


    /**
     * 用户事件
     *
     * @param ctx
     * @param evt
     * @throws Exception
     */
    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
        super.userEventTriggered (ctx, evt);
    }


    /**
     * 出现异常
     *
     * @param ctx
     * @param cause
     * @throws Exception
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        String droneLoginkey = CacheConstants.DRONE_LOGIN_key + ((InetSocketAddress) ctx.channel ().remoteAddress ()).toString ();
        if (loginHandler.redisCache.hasKey (droneLoginkey)) {
            loginHandler.redisCache.deleteObject (droneLoginkey);
        }
        logger.debug ("无人机:"+((InetSocketAddress) ctx.channel ().remoteAddress ()).toString ()+",下线");
        super.exceptionCaught (ctx, cause);
    }
}
