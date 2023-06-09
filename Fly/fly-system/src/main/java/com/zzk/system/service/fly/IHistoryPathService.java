package com.zzk.system.service.fly;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.zzk.system.domain.fly.HistoryPath;
import com.zzk.system.domain.vo.fly.HistoryPathQueryVo;

/**
 * @description: 历史路径服务层
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/27 14:01
 */
public interface IHistoryPathService {
    /**
     * 上传路径
     * @param path
     * @return
     */
    HistoryPath uploadPath(HistoryPath path);

    /**
     * 查询历史路径list
     * @param pathQueryVo
     * @return
     */
    Object list(HistoryPathQueryVo pathQueryVo);

    /**
     * 查询历史路径细节
     * @param id
     * @return
     */
    HistoryPath queryPathDeatilsById(String id);

    /**
     * 删除历史路径
     * @param id
     * @return
     */
    DeleteResult deleteHistoryPathById(String id);

    /**
     * 修改历史路径
     * @param historyPath
     * @return
     */
    UpdateResult updatePath(HistoryPath historyPath);
}
