package com.zzk.system.service.fly.impl;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.zzk.common.utils.SecurityUtils;
import com.zzk.common.utils.StringUtils;
import com.zzk.system.domain.fly.HistoryPath;
import com.zzk.system.domain.fly.PlanPath;
import com.zzk.system.domain.vo.fly.HistoryPathQueryResult;
import com.zzk.system.domain.vo.fly.PageResult;
import com.zzk.system.domain.vo.fly.PlanPathQueryResult;
import com.zzk.system.domain.vo.fly.PlanPathQueryVo;
import com.zzk.system.service.fly.IPlanPathService;
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
 * @description: 规划航线service
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/02 16:43
 */
@Service
public class PlanPathServiceImpl implements IPlanPathService {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public PlanPath uploadPath(PlanPath path) {
        path.setId (ObjectId.get ());
        path.setUserId (SecurityUtils.getLoginUser().getUserId ().toString ());
        path.setUsername (SecurityUtils.getLoginUser ().getUsername ());
        path.setCreatedAt(new Date ());
        return mongoTemplate.save (path);
    }

    @Override
    public Object list(PlanPathQueryVo pathQueryVo) {
        PageResult pageResult = new PageResult ();
        pageResult.setPageNum (pathQueryVo.getPageNum ());
        pageResult.setPagesize (pathQueryVo.getPageSize ());

        //查询MongoDB
        PageRequest pageRequest = PageRequest.of (pathQueryVo.getPageNum () - 1, pathQueryVo.getPageSize (), Sort.by (Sort.Order.desc ("createdAt")));
        Criteria criteria = new Criteria();
        if (StringUtils.isNotBlank (pathQueryVo.getDroneObjectId ())) {
            criteria.and ("droneObjectId").is (new ObjectId (pathQueryVo.getDroneObjectId ()));
        }
        if (StringUtils.isNotBlank (pathQueryVo.getPlanName ())) {
            criteria.and ("planName").is (pathQueryVo.getPlanName ());
        }
        if (StringUtils.isNotBlank (pathQueryVo.getUsername ())) {
            criteria.and ("username").is (pathQueryVo.getUsername ());
        }
        Query query = new Query (criteria).with (pageRequest);
        List<PlanPathQueryResult> planPathQueryResults = mongoTemplate.find(query, PlanPathQueryResult.class);
        Query queryTotal =new Query (criteria);
        pageResult.setTotal (mongoTemplate.count (queryTotal,PlanPathQueryResult.class));
        if (CollectionUtils.isEmpty (planPathQueryResults)) {
            return pageResult;
        }
        pageResult.setItems(planPathQueryResults);
        return pageResult;
    }

    @Override
    public PlanPath queryPathDeatilsById(String id) {
        Query query = new Query(Criteria.where("id").is(new ObjectId(id)));
        return mongoTemplate.findOne (query, PlanPath.class);
    }

    @Override
    public DeleteResult deletePlanById(String id) {
        Query query = new Query(Criteria.where("id").is(new ObjectId(id)));
        return mongoTemplate.remove (query, PlanPath.class);
    }

    @Override
    public UpdateResult updatePath(PlanPath planPath) {
        Query query = new Query(Criteria.where("_id").is(planPath.getId ()));
        Update update = new Update()
                .set ("planName",planPath.getPlanName ());
        return mongoTemplate.updateFirst(query, update, HistoryPath.class);
    }
}
