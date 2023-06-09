package com.zzk.web.controller.fly;

import com.mongodb.client.result.DeleteResult;
import com.zzk.common.annotation.Log;
import com.zzk.common.core.domain.AjaxResult;
import com.zzk.common.enums.BusinessType;
import com.zzk.system.domain.fly.Drone;
import com.zzk.system.domain.vo.fly.DroneQueryVo;
import com.zzk.system.service.fly.IDroneListService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @description: 无人机列表接口
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/09 15:03
 */
@RestController
@RequestMapping("/fly/flylist")
public class DroneController {


    @Autowired
    private IDroneListService droneListService;

    @PostMapping("/list")
    public Object queryDroneList(@RequestBody DroneQueryVo droneQueryVo){
        return droneListService.queryDroneList (droneQueryVo);
    }

    @Log(title = "无人机列表", businessType = BusinessType.DELETE)
    @GetMapping("/delete/{id}")
    public AjaxResult deleteDroneById(@PathVariable("id") String id){
        DeleteResult deleteResult = droneListService.deleteDroneById (id);
        return deleteResult.getDeletedCount () > 0? AjaxResult.success (): AjaxResult.error ();
    }

    @GetMapping("/details/{id}")
    public AjaxResult queryDroneById(@PathVariable("id") String id){
        return AjaxResult.success(droneListService.queryDroneById (id));

    }
    @Log(title = "无人机列表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult createDrone(@RequestBody Drone drone){
        return ObjectUtils.isNotEmpty (droneListService.addDrone (drone))? AjaxResult.success (): AjaxResult.error ("无人机id或北斗卡号已经存在，请删除再添加");
    }

    @Log(title = "无人机列表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editDrone(@RequestBody Drone drone){
        return droneListService.updateDrone (drone).getModifiedCount ()>0 ? AjaxResult.success (): AjaxResult.error ("无人机id或北斗卡号已经存在，请检查后再修改");
    }

}
