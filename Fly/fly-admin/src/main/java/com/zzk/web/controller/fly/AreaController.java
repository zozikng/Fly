package com.zzk.web.controller.fly;

import com.mongodb.client.result.DeleteResult;
import com.zzk.common.annotation.Log;
import com.zzk.common.core.domain.AjaxResult;
import com.zzk.common.enums.BusinessType;
import com.zzk.system.domain.fly.Area;
import com.zzk.system.domain.vo.fly.AreaQueryVo;
import com.zzk.system.service.fly.IAreaService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.geo.GeoJsonPoint;
import org.springframework.web.bind.annotation.*;

/**
 * @description: 禁飞区controller
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/04 15:22
 */
@RestController
@RequestMapping("/fly/area")
public class AreaController {


    @Autowired
    private IAreaService areaService;


    /**
     * 上传禁飞区
     *
     * @param
     * @return
     */
    @Log(title = "电子围栏", businessType = BusinessType.INSERT)
    @PostMapping("/upload")
    public AjaxResult uploadArea(@RequestBody Area area) {
        return ObjectUtils.isNotEmpty (areaService.insert (area)) ? AjaxResult.success () : AjaxResult.error ();
    }


    /**
     * 查询规划路径list
     */
    @PostMapping("/list")
    public Object list(@RequestBody AreaQueryVo areaQueryVo) {
        return areaService.list (areaQueryVo);
    }
    /**
     * 查询规划路径listAll
     */
    @PostMapping("/listall")
    public Object list() {
        return areaService.listAll ();
    }

    /**
     * 查询禁飞区细节
     * @param id
     * @return
     */
    @GetMapping("/details/{id}")
    public AjaxResult queryareaDeatilsById(@PathVariable("id") String id){
        return AjaxResult.success(areaService.queryAearDeatilsById (id));
    }


    /**
     * 删除禁飞区
     * @param id
     * @return
     */
    @Log(title = "电子围栏", businessType = BusinessType.DELETE)
    @GetMapping("/delete/{id}")
    public AjaxResult deleteAreaById(@PathVariable("id") String id){
        DeleteResult deleteResult = areaService.deleteAearById (id);
        return deleteResult.getDeletedCount () > 0? AjaxResult.success (): AjaxResult.error ();
    }

    /**
     * 更新规划路径
     * @param area
     * @return
     */
    @Log(title = "电子围栏", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editPath(@RequestBody Area area){
        return areaService.updateAear (area).getModifiedCount ()>0 ? AjaxResult.success (): AjaxResult.error ("更新失败");
    }


    /**
     * 是否在禁飞区
     * @param x
     * @param y
     * @return
     */
    @GetMapping("/in/{x}/{y}")
    public AjaxResult pointIsInArea (@PathVariable("x") double x,@PathVariable("y") double y){

        GeoJsonPoint geoJsonPoint = new GeoJsonPoint (x, y);

        return areaService.pointIsInArea (geoJsonPoint) ? AjaxResult.success (): AjaxResult.error ("不存在");
    }

}
