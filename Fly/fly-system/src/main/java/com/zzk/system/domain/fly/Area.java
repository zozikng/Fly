package com.zzk.system.domain.fly;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.geo.GeoJsonPolygon;
import org.springframework.data.mongodb.core.index.CompoundIndex;
import org.springframework.data.mongodb.core.index.CompoundIndexes;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @description: 禁飞区
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/03 23:21
 */
@Data
@Document(collection = "area")
@CompoundIndexes({
        @CompoundIndex(name = "2dsphere_index_01", def = "{'geoJsonPolygon': '2dsphere'}"),
})
public class Area {

    @Id
    @JsonSerialize(using = ObjectIdSerializer.class)
    private ObjectId id;

    @Field("areaName")
    private String areaName;

    @Field("geoJsonPolygon")
    //区域点坐标集合 多边形
    private GeoJsonPolygon geoJsonPolygon;

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
