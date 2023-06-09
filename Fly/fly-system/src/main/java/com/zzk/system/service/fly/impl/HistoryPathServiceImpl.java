package com.zzk.system.service.fly.impl;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.zzk.common.utils.SecurityUtils;
import com.zzk.common.utils.StringUtils;
import com.zzk.common.utils.bean.BeanUtils;
import com.zzk.system.domain.fly.Drone;
import com.zzk.system.domain.fly.HistoryPath;
import com.zzk.system.domain.vo.fly.HistoryPathQueryResult;
import com.zzk.system.domain.vo.fly.HistoryPathQueryVo;
import com.zzk.system.domain.vo.fly.PageResult;
import com.zzk.system.service.fly.IHistoryPathService;
import org.apache.commons.lang3.ObjectUtils;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @description: 历史路径服务层
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/27 14:02
 */
@Service
public class HistoryPathServiceImpl implements IHistoryPathService {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public HistoryPath uploadPath(HistoryPath path) {
        path.setId (ObjectId.get ());
        path.setUserId (SecurityUtils.getLoginUser().getUserId ().toString ());
        path.setUsername (SecurityUtils.getLoginUser ().getUsername ());
        path.setCreatedAt(new Date ());
        return mongoTemplate.save (path);
    }

    @Override
    public Object list(HistoryPathQueryVo pathQueryVo) {
        PageResult pageResult = new PageResult ();
        pageResult.setPageNum (pathQueryVo.getPageNum ());
        pageResult.setPagesize (pathQueryVo.getPageSize ());

        //查询MongoDB
        PageRequest pageRequest = PageRequest.of (pathQueryVo.getPageNum () - 1, pathQueryVo.getPageSize (), Sort.by (Sort.Order.desc ("createdAt")));
        Criteria criteria = new Criteria();
        if (StringUtils.isNotBlank (pathQueryVo.getDroneName ())) {
            criteria.and ("droneName").is (pathQueryVo.getDroneName ());
        }
        if (StringUtils.isNotBlank (pathQueryVo.getDroneObjectId ())) {
            criteria.and ("droneObjectId").is (new ObjectId (pathQueryVo.getDroneObjectId ()));
        }
        if (StringUtils.isNotBlank (pathQueryVo.getUsername ())) {
            criteria.and ("username").is (pathQueryVo.getUsername ());
        }
        if (StringUtils.isNotBlank (pathQueryVo.getUserId ())){
            criteria.and ("userId").is (pathQueryVo.getUserId ());
        }
        if (StringUtils.isNotBlank (pathQueryVo.getDroneId ())){
            criteria.and ("droneId").is (pathQueryVo.getDroneId ());
        }
        if (StringUtils.isNotBlank (pathQueryVo.getCardId ())){
            criteria.and ("cardId").is (pathQueryVo.getCardId ());
        }
        if (StringUtils.isNotBlank (pathQueryVo.getPathName ())){
            criteria.and ("pathName").is (pathQueryVo.getPathName ());
        }
        Query query = new Query (criteria).with (pageRequest);
        List<HistoryPathQueryResult> historyPathList = mongoTemplate.find(query, HistoryPathQueryResult.class);
        Query queryTotal =new Query (criteria);
        pageResult.setTotal (mongoTemplate.count (queryTotal,HistoryPathQueryResult.class));
        if (CollectionUtils.isEmpty (historyPathList)) {
            return pageResult;
        }
        pageResult.setItems(historyPathList);
        return pageResult;
    }

    @Override
    public HistoryPath queryPathDeatilsById(String id) {
        Query query = new Query(Criteria.where("id").is(new ObjectId(id)));
        return mongoTemplate.findOne (query, HistoryPath.class);
    }

    @Override
    public DeleteResult deleteHistoryPathById(String id) {
        Query query = new Query(Criteria.where("id").is(new ObjectId(id)));
        return mongoTemplate.remove (query, HistoryPath.class);
    }

    @Override
    public UpdateResult updatePath(HistoryPath historyPath) {

        Query query = new Query(Criteria.where("_id").is(historyPath.getId ()));
        Update update = new Update()
                .set ("pathName",historyPath.getPathName ());
        return mongoTemplate.updateFirst(query, update, HistoryPath.class);
    }


}
