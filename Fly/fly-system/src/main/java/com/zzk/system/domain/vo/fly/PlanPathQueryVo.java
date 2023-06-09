package com.zzk.system.domain.vo.fly;

import com.zzk.system.domain.fly.Location;
import lombok.Data;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @description: 查询规划航迹Vo
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/02 16:55
 */
@Data
public class PlanPathQueryVo {
    private Integer pageNum = 1;
    private Integer pageSize = 10;


    /**
     * 无人机ObjectId
     */
    @Field("droneObjectId")
    private String droneObjectId;

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
