package com.zzk.web.netty.Handler;

import com.mongodb.client.result.UpdateResult;
import com.zzk.common.constant.CacheConstants;
import com.zzk.common.core.redis.RedisCache;
import com.zzk.system.domain.fly.Drone;
import com.zzk.system.service.fly.IDroneListService;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import javax.annotation.PostConstruct;
import java.net.InetSocketAddress;
import java.util.Map;

/**
 * @description: 心跳handler
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/16 16:43
 */
@Component
public class HeartBeatHandler extends ChannelInboundHandlerAdapter {


    @Autowired
    private RedisCache redisCache;

    @Autowired
    private IDroneListService droneListService;

    private static HeartBeatHandler heartBeatHandler;

    private static final Logger logger = LoggerFactory.getLogger (HeartBeatHandler.class);

    /**
     * 通过注解@PostConstruct ，在初始化的时候初始化静态对象和它的静态成员变量Service，原理是拿到service层bean对象，静态存储下来，防止被释放。
     */
    @PostConstruct //通过@PostConstruct实现初始化bean之前进行的操作
    public void init() {
        heartBeatHandler = this;
        heartBeatHandler.redisCache = this.redisCache;
        heartBeatHandler.droneListService = this.droneListService;
        // 初使化时将已静态化的testService实例化
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
        String droneLoginkey = CacheConstants.DRONE_LOGIN_key + ((InetSocketAddress) ctx.channel ().remoteAddress ()).toString ();
        if (heartBeatHandler.redisCache.hasKey (droneLoginkey)) {
            byte[] heartBeatMsg = (byte[]) msg;
            if (heartBeatMsg[0] == 0x03 && heartBeatMsg.length == 10) {

                //解析飞行器id
                String status = String.valueOf (ByteUtils.byteHEX2IntDEC (heartBeatMsg[1]));
                Double currentBatteryLevel = Double.valueOf (ByteUtils.byteHEX2IntDEC (heartBeatMsg[2]));
                String signal = String.valueOf (ByteUtils.byteHEX2IntDEC (heartBeatMsg[3]));
                Map<String, Object> droneLoginMap = heartBeatHandler.redisCache.getCacheMap (droneLoginkey);
                String droneId = (String) droneLoginMap.get ("droneId");
                String cardId = (String) droneLoginMap.get ("cardId");
                Drone drone = heartBeatHandler.droneListService.queryDroneByDroneIdandCardId (droneId, cardId);
                if (!ObjectUtils.isEmpty (drone)) {
                    drone.setStatus (status);
                    drone.setCurrentBatteryLevel (currentBatteryLevel.toString ());
                    drone.setSignal (signal);
                    UpdateResult updateResult = heartBeatHandler.droneListService.updateDrone (drone);
                    logger.debug ("无人机：{}，心跳数据{}", ((InetSocketAddress) ctx.channel ().remoteAddress ()).toString (), updateResult.getModifiedCount () > 0 ? "更新成功" : "更新失败");
                    ctx.writeAndFlush (msg);
                } else {
                    logger.debug ("无人机:【" + droneId + "】" + "不存在，或卡号【" + cardId + "】不对");
                }
            } else {
                ctx.fireChannelRead (msg);
            }
        } else {
            logger.debug ("无人机:" + ((InetSocketAddress) ctx.channel ().remoteAddress ()).toString () + ",还未登录，不能心跳数据");
            ctx.fireChannelRead (msg);
        }


    }
}
