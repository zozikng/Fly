package com.zzk.system.service.fly;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.zzk.system.domain.fly.HistoryPath;
import com.zzk.system.domain.fly.PlanPath;
import com.zzk.system.domain.vo.fly.PlanPathQueryVo;

/**
 * @description: 规划航线Service
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/02 16:42
 */
public interface IPlanPathService {


    /**
     * 上传路径
     * @param path
     * @return
     */
    PlanPath uploadPath(PlanPath path);

    /**
     * 查询计划列表
     * @param pathQueryVo
     * @return
     */
    Object list(PlanPathQueryVo pathQueryVo);

    /**
     * 查询规划路径细节
     * @param id
     * @return
     */
    PlanPath queryPathDeatilsById(String id);

    /**
     * 删除规划
     * @param id
     * @return
     */
    DeleteResult deletePlanById(String id);

    /**
     * 更新规划路径
     * @param planPath
     * @return
     */
    UpdateResult updatePath(PlanPath planPath);

}
