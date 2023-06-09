package com.zzk.system.service.fly;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.zzk.system.domain.fly.Area;
import com.zzk.system.domain.vo.fly.AreaQueryVo;
import org.springframework.data.mongodb.core.geo.GeoJsonPoint;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @description: 禁飞区service
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/03 23:33
 */
public interface IAreaService {


    /**
     * 插入禁飞区
     * @param area
     * @return
     */
    Area insert(Area area);


    /**
     * 是否在区域内
     * @param point
     * @return
     */
    boolean pointIsInArea(GeoJsonPoint point);


    /**
     * 查询禁飞区细节
     * @param id
     * @return
     */
    Area queryAearDeatilsById(String id);

    /**
     * 删除禁飞区
     * @param id
     * @return
     */
    DeleteResult deleteAearById(String id);

    /**
     * 更新禁飞区
     * @param area
     * @return
     */
    UpdateResult updateAear(Area area);


    /**
     * 查询禁飞区list
     */
    Object list(AreaQueryVo areaQueryVo);

    /**
     * 查询规划路径listAll
     * @return
     */
    Object listAll();


}
