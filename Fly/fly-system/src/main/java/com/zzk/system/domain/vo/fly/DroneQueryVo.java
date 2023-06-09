package com.zzk.system.domain.vo.fly;

import lombok.Data;

/**
 * @description: 无人机查询vo
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/10 13:45
 */
@Data
public class DroneQueryVo {

    private Integer pageNum = 1;
    private Integer pageSize = 10;
    private String droneName; //无人机名称
    private String model; //无人机型号
    private String userId;//用户id
    private String username;//用户名称
    private String currentBatteryLevel;//当前电池量
    private String status;//状态

    private String droneId;//飞行器id

    private String cardId;//飞行器id

}
