package com.zzk.web.controller.fly;

import com.mongodb.client.result.DeleteResult;
import com.zzk.common.annotation.Log;
import com.zzk.common.core.domain.AjaxResult;
import com.zzk.common.enums.BusinessType;
import com.zzk.system.domain.fly.HistoryPath;
import com.zzk.system.domain.fly.PlanPath;
import com.zzk.system.domain.vo.fly.HistoryPathQueryVo;
import com.zzk.system.domain.vo.fly.PlanPathQueryVo;
import com.zzk.system.service.fly.IPlanPathService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @description: 规划路径接口
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/02 16:31
 */
@RestController
@RequestMapping("/fly/planpath")
public class PlanPathController {


    @Autowired
    private IPlanPathService planPathService;


    /**
     * 上传历史路径
     *
     * @param path
     * @return
     */
    @Log(title = "规划轨迹", businessType = BusinessType.INSERT)
    @PostMapping("/upload")
    public AjaxResult uploadPath(@RequestBody PlanPath path) {
        return ObjectUtils.isNotEmpty (planPathService.uploadPath (path)) ? AjaxResult.success () : AjaxResult.error ();
    }

    /**
     * 查询规划路径list
     */
    @PostMapping("/list")
    public Object list(@RequestBody PlanPathQueryVo pathQueryVo) {
        return planPathService.list (pathQueryVo);
    }


    /**
     * 查询规划路径细节
     * @param id
     * @return
     */
    @GetMapping("/details/{id}")
    public AjaxResult queryPathDeatilsById(@PathVariable("id") String id){
        return AjaxResult.success(planPathService.queryPathDeatilsById (id));
    }


    /**
     * 删除规划路径
     * @param id
     * @return
     */
    @Log(title = "规划轨迹", businessType = BusinessType.DELETE)
    @GetMapping("/delete/{id}")
    public AjaxResult deletePlanById(@PathVariable("id") String id){
        DeleteResult deleteResult = planPathService.deletePlanById (id);
        return deleteResult.getDeletedCount () > 0? AjaxResult.success (): AjaxResult.error ();
    }

    /**
     * 更新规划路径
     * @param planPath
     * @return
     */
    @Log(title = "规划轨迹", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editPath(@RequestBody PlanPath planPath){
        return planPathService.updatePath (planPath).getModifiedCount ()>0 ? AjaxResult.success (): AjaxResult.error ("修改失败");
    }
}
