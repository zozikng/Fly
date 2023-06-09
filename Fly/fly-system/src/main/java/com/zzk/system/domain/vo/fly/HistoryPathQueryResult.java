package com.zzk.system.domain.vo.fly;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.zzk.system.domain.fly.Location;
import com.zzk.system.domain.fly.ObjectIdSerializer;
import lombok.Data;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @description: 历史路径结果
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/27 14:56
 */
@Data
@Document(collection = "historyPath")
public class HistoryPathQueryResult {

    /**
     * 历史路径唯一标识
     */
    @Id
    @JsonSerialize(using = ObjectIdSerializer.class)
    private ObjectId id;

    /**
     * 无人机ObjectId
     */
    @Field("droneObjectId")
    private ObjectId droneObjectId;
    /**
     * 无人机id
     */
    @Field("droneId")
    private String droneId;
    /**
     * 无人机名称
     */
    @Field("droneName")
    private String droneName;
    /**
     * 北斗卡号
     */
    @Field("cardId")
    private String cardId;

    /**
     * 路径名称
     */
    @Field("pathName")
    private String pathName;

    /**
     * 路径起始点
     */
    @Field("startPoint")
    private String startPoint;
    /**
     * 路径结束点
     */
    @Field("endPoint")
    private String endPoint;

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
     * 路径创建时间
     */
    @Field("createdAt")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date createdAt;


}
