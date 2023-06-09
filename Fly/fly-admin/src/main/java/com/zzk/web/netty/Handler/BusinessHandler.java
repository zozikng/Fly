package com.zzk.web.netty.Handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.client.result.UpdateResult;
import com.zzk.common.constant.CacheConstants;
import com.zzk.common.core.redis.RedisCache;
import com.zzk.system.domain.fly.Drone;
import com.zzk.system.domain.fly.Location;
import com.zzk.system.domain.vo.fly.DroneQueryVo;
import com.zzk.system.service.fly.IAreaService;
import com.zzk.system.service.fly.IDroneListService;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.geo.GeoJsonPoint;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import javax.annotation.PostConstruct;
import java.net.InetSocketAddress;
import java.util.Date;

/**
 * @description:
 * @program: nettyTestDemo
 * @author: zzk
 * @created: 2021/12/04 19:06
 */
@Component
public class BusinessHandler extends ChannelInboundHandlerAdapter {


    @Autowired
    private IDroneListService droneListService;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private IAreaService areaService;

    public static BusinessHandler businessHandler;


    @PostConstruct //通过@PostConstruct实现初始化bean之前进行的操作
    public void init() {
        businessHandler = this;
        businessHandler.droneListService = this.droneListService;
        businessHandler.redisCache = this.redisCache;
        businessHandler.areaService= this.areaService;
    }


    private static final Logger logger = LoggerFactory.getLogger (BusinessHandler.class);

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        String droneLoginkey = CacheConstants.DRONE_LOGIN_key + ((InetSocketAddress) ctx.channel ().remoteAddress ()).toString ();
        if (businessHandler.redisCache.hasKey (droneLoginkey)) {
            byte[] locationMsg = (byte[]) msg;
            //定位数据包
            if (locationMsg[0] == 0x02) {
                byte[] cardIdByte = ByteUtils.subBytes (locationMsg, 1, 5);
                String cardId = ByteUtils.byteHEX2StringDEC (cardIdByte);
                String droneId = businessHandler.redisCache.getCacheMapValue (droneLoginkey, "droneId"); toString ();
                //是否定位标志
                boolean flag = ByteUtils.byte2Boolean (locationMsg[6]);
                if (flag) {
                    Location location = convertLocation (locationMsg);
                    Drone drone = businessHandler.droneListService.queryDroneByDroneIdandCardId (droneId, cardId);
                    if (!ObjectUtils.isEmpty (drone)) {
                        Gps gps = PositionUtil.gps84_To_Gcj02 (Double.parseDouble (location.getLat ()),Double.parseDouble (location.getLng ()));
                        GeoJsonPoint geoJsonPoint = new GeoJsonPoint (gps.getWgLon (), gps.getWgLat ());
                        if (businessHandler.areaService.pointIsInArea (geoJsonPoint)){
                            drone.setStatus ("4");
                        } else if (drone.getStatus ().equals ("4")) {
                            drone.setStatus ("0");
                        }
                        location.setLng (String.valueOf (gps.getWgLon ()));
                        location.setLat (String.valueOf (gps.getWgLat ()));
                        drone.setLocation (location);
                        logger.debug ("定位数据:" + drone);

                        UpdateResult updateResult = businessHandler.droneListService.updateDrone (drone);
                        logger.debug ("无人机：{}，定位数据{}",((InetSocketAddress) ctx.channel ().remoteAddress ()).toString (),updateResult.getModifiedCount ()>0? "更新成功":"更新失败");
                        ctx.writeAndFlush (msg);
                    }else {
                        logger.debug ("无人机:【"+droneId+"】"+"不存在，或卡号【"+cardId+"】不对");
                    }

                }
            }
        } else {
            logger.debug ("无人机:" + ((InetSocketAddress) ctx.channel ().remoteAddress ()).toString () + ",还未登录，不能定位数据");
            ctx.fireChannelRead (msg);
        }
    }

    private Location convertLocation(byte[] locationMsg) {
        //日期字节
        byte[] dateByte = ByteUtils.subBytes (locationMsg, 7, 3);
        //时间字节
        byte[] timeByte = ByteUtils.subBytes (locationMsg, 10, 3);
        //经度字节
        byte[] lngByte = ByteUtils.subBytes (locationMsg, 13, 4);
        //维度字节
        byte[] latByte = ByteUtils.subBytes (locationMsg, 17, 4);
        //速度字节
        byte[] speedByte = ByteUtils.subBytes (locationMsg, 21, 2);
        //方向字节
        byte[] altitudeByte = ByteUtils.subBytes (locationMsg, 23, 2);
        byte[] directionByte = ByteUtils.subBytes (locationMsg, 25, 2);
        Date dateTime = ByteUtils.bytes2DateTime (dateByte, timeByte);
        String lng = ByteUtils.bytes2LngOrLat (lngByte);
        String lat = ByteUtils.bytes2LngOrLat (latByte);
        String speed = ByteUtils.byteHEX2StringDEC (speedByte);
        String altitude = ByteUtils.byteHEX2StringDEC (altitudeByte);
        String direction = ByteUtils.byteHEX2StringDEC (directionByte);
        Location location = new Location ();
        location.setLng (lng);
        location.setLat (lat);
        location.setSpeed (speed);
        location.setAltitude (altitude);
        location.setDirection (direction);
        location.setDateTime (dateTime);


        return location;
    }


}
