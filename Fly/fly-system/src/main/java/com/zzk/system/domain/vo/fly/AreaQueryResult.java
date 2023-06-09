package com.zzk.system.domain.vo.fly;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.zzk.system.domain.fly.ObjectIdSerializer;
import lombok.Data;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @description: 禁飞区list结果
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/02 16:59
 */
@Data
@Document(collection = "area")
public class AreaQueryResult {

    /**
     * 历史路径唯一标识
     */
    @Id
    @JsonSerialize(using = ObjectIdSerializer.class)
    private ObjectId id;



    /**
     * 禁飞区名称
     */
    @Field("areaName")
    private String areaName;


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
     * 禁飞区创建时间
     */
    @Field("createdAt")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date createdAt;

}
