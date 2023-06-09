package com.zzk.system.domain.vo.fly;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.zzk.system.domain.fly.Location;
import com.zzk.system.domain.fly.ObjectIdSerializer;
import lombok.Data;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @description: 查询历史路径vo
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/27 14:28
 */
@Data
public class HistoryPathQueryVo {
    private Integer pageNum = 1;
    private Integer pageSize = 10;

    /**
     * 历史路径唯一标识
     */
    private String id;
    /**
     * 无人机ObjectId
     */
    private String droneObjectId;


    //下面暂时用不到

    /**
     * 无人机id
     */
    private String droneId;
    /**
     * 无人机名称
     */
    private String droneName;
    /**
     * 北斗卡号
     */
    private String cardId;
    /**
     * 路径名称
     */
    private String pathName;

    /**
     * 路径起始点
     */
    private String startPoint;
    /**
     * 路径结束点
     */
    private String endPoint;


    /**
     * 用户id
     */
    private String userId;
    /**
     * 用户名称
     */
    private String username;

    /**
     * 路径创建时间
     */
    private Date createdAt;
}
