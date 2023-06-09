package com.zzk.system.domain.fly;

import com.alibaba.fastjson2.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.geo.GeoJsonPoint;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @description: 飞行器类
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/09 15:14
 */
@Data
@Document(collection = "drone")
public class Drone {

    /**
     * 无人机唯一标识
     */
    @Id
    @JsonSerialize(using = ObjectIdSerializer.class)
    private ObjectId id;

    /**
     * 终端id
     */
    @Field("droneId")
    private String droneId;

    /**
     * 无人机名称
     */
    @Field("droneName")
    private String droneName;
    /**
     * 无人机型号
     */
    @Field("model")
    private String model;
    /**
     * 终端北斗卡号
     */
    @Field("cardId")
    private String cardId;

    /**
     * 用户id
     */
    @Field("userId")
    private String userId;
    /**
     * 用户名称
     */
    @Field("username")
    private String username;
    /**
     * 当前电池电量
     */
    @Field("currentBatteryLevel")
    private String currentBatteryLevel;
    /**
     * 无人机的位置，使用MongoDB的地理空间索引
     */
    @Field("location")
    private Location location;
    /**
     * 无人机的状态，0x00:正常，0x01：低电量，0x02：SOS，0x03：拆除
     */
    @Field("status")
    private String status;

    /**
     * 无人机信号强度：0x00:无信号，0x01：信号极弱，0x02信号较弱，0x03型号良好，0x04：信号强
     */
    @Field("signal")
    private String signal="4";

    /**
     * 无人机的创建时间
     */
    @Field("createdAt")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    //@JSONField(serialize = false)
    //@JsonIgnore
    private Date createdAt;

    /**
     * 无人机最后一次更新的时间
     */
    @Field("updatedAt")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    //@JsonIgnore
    private Date updatedAt;


}
