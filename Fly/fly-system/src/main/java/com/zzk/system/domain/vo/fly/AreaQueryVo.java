package com.zzk.system.domain.vo.fly;

import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @description: 查询禁飞区Vo
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/02 16:55
 */
@Data
public class AreaQueryVo {
    private Integer pageNum = 1;
    private Integer pageSize = 10;



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
