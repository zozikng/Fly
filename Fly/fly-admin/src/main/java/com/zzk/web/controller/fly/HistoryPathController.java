package com.zzk.web.controller.fly;

import com.mongodb.client.result.DeleteResult;
import com.zzk.common.annotation.Log;
import com.zzk.common.core.domain.AjaxResult;
import com.zzk.common.enums.BusinessType;
import com.zzk.system.domain.fly.HistoryPath;
import com.zzk.system.domain.vo.fly.HistoryPathQueryVo;
import com.zzk.system.service.fly.IHistoryPathService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @description: 历史路径接口
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/27 13:55
 */
@RestController
@RequestMapping("/fly/historypath")
public class HistoryPathController {


    @Autowired
    private IHistoryPathService historyPathService;


    /**
     * 上传历史路径
     *
     * @param path
     * @return
     */
    @Log(title = "历史轨迹", businessType = BusinessType.INSERT)
    @PostMapping("/upload")
    public AjaxResult uploadPath(@RequestBody HistoryPath path) {
        return ObjectUtils.isNotEmpty (historyPathService.uploadPath (path)) ? AjaxResult.success () : AjaxResult.error ();
    }


    /**
     * 查询历史路径list
     */
    @PostMapping("/list")
    public Object list(@RequestBody HistoryPathQueryVo pathQueryVo) {
        return historyPathService.list (pathQueryVo);
    }



    /**
     * 查询历史路径细节
     * @param id
     * @return
     */
    @Log(title = "历史轨迹", businessType = BusinessType.OTHER)
    @GetMapping("/details/{id}")
    public AjaxResult queryPathDeatilsById(@PathVariable("id") String id){
        return AjaxResult.success(historyPathService.queryPathDeatilsById (id));

    }

    /**
     * 删除历史路径
     * @param id
     * @return
     */
    @Log(title = "历史轨迹", businessType = BusinessType.DELETE)
    @GetMapping("/delete/{id}")
    public AjaxResult deleteHistoryPathById(@PathVariable("id") String id){
        DeleteResult deleteResult = historyPathService.deleteHistoryPathById (id);
        return deleteResult.getDeletedCount () > 0? AjaxResult.success (): AjaxResult.error ();
    }


    /**
     * 更新历史路径
     * @param historyPath
     * @return
     */
    @Log(title = "历史轨迹", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editPath(@RequestBody HistoryPath historyPath){
        return historyPathService.updatePath (historyPath).getModifiedCount ()>0 ? AjaxResult.success (): AjaxResult.error ("修改失败");
    }



}
