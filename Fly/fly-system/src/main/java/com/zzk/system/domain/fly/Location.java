package com.zzk.system.domain.fly;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @description: 位置
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/09 16:29
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Location {

    /**
     * 日期+时间
     */
    @Field("dateTime")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date dateTime;
    /**
     * 纬度
     */
    @Field("lat")
    private String lat; //纬度
    /**
     * 精度
     */
    @Field("lng")
    private String lng; //经度

    /**
     * 速度
     */
    @Field("speed")
    private String speed;
    /**
     * 所在高度
     */
    @Field("altitude")
    private String altitude;
    /**
     * 方向
     */
    @Field("direction")
    private String direction;

}
