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
 * @description: 规划航线list结果
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/02 16:59
 */
@Data
@Document(collection = "planPath")
public class PlanPathQueryResult {

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
     * 计划名称名称
     */
    @Field("planName")
    private String planName;


    /**
     * 创建用户id
     */
    @Field("userId")
    private String userId;
    /**
     * 创建用户名称
     */
    @Field("username")
    private String username;

    /**
     * 计划创建时间
     */
    @Field("createdAt")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date createdAt;

}
