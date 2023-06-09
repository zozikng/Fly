package com.zzk.system.service.fly;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.zzk.system.domain.fly.Drone;
import com.zzk.system.domain.vo.fly.DroneQueryVo;

/**
 * @description: 飞行器列表service
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/09 16:19
 */
public interface IDroneListService {

    /**
     * 添加飞行器
     *
     * @param drone
     */
    Drone addDrone(Drone drone);


    /**
     * 查询飞行器列表
     *
     * @param droneQueryVo
     * @return
     */
    Object queryDroneList(DroneQueryVo droneQueryVo);

    /**
     * 根据id删除无人机
     *
     * @param id
     */
    DeleteResult deleteDroneById(String id);


    /**
     * 根据id查询无人机详情
     *
     * @param id
     */
    Object queryDroneById(String id);

    /**
     * 根据无人机id和北斗卡Id查询无人机
     * @param droneId
     * @param cardId
     * @return
     */
    Drone queryDroneByDroneIdandCardId(String droneId, String cardId);

    /**
     * 更新无人机信息
     *
     * @param drone
     */
    UpdateResult updateDrone(Drone drone);


    /**
     * 判断是否存在无人机
     * @param droneId
     * @param cardId
     * @return
     */
    boolean existsDrone(String droneId, String cardId);
}
