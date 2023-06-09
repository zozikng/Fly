package com.zzk.system.service.fly.impl;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.zzk.common.utils.SecurityUtils;
import com.zzk.common.utils.StringUtils;
import com.zzk.system.domain.fly.Area;
import com.zzk.system.domain.vo.fly.AreaQueryResult;
import com.zzk.system.domain.vo.fly.AreaQueryVo;
import com.zzk.system.domain.vo.fly.PageResult;
import com.zzk.system.service.fly.IAreaService;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.geo.GeoJsonPoint;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @description: 禁飞区service
 * @program: Fly
 * @author: zzk
 * @created: 2023/04/03 23:36
 */
@Service
public class AreaServiceImpl implements IAreaService {

    @Autowired
    private MongoTemplate mongoTemplate;


    @Override
    public Area insert(Area area) {
        area.setId (ObjectId.get ());
        area.setUserId (SecurityUtils.getLoginUser().getUserId ().toString ());
        area.setUsername (SecurityUtils.getLoginUser ().getUsername ());
        area.setCreatedAt(new Date ());
        return mongoTemplate.save (area);
    }

    @Override
    public boolean pointIsInArea(GeoJsonPoint point) {
        Query query = new Query();
        query.addCriteria(Criteria.where("geoJsonPolygon").intersects(point));
        Area area = mongoTemplate.findOne(query, Area.class);
        return area != null;
    }

    @Override
    public Area queryAearDeatilsById(String id) {
        Query query = new Query(Criteria.where("id").is(new ObjectId(id)));
        return mongoTemplate.findOne (query, Area.class);
    }

    @Override
    public DeleteResult deleteAearById(String id) {
        Query query = new Query(Criteria.where("id").is(new ObjectId(id)));
        return mongoTemplate.remove (query, Area.class);
    }

    @Override
    public UpdateResult updateAear(Area area) {
        Query query = new Query(Criteria.where("_id").is(area.getId ()));
        Update update = new Update()
                .set ("areaName", area.getAreaName ());
        return mongoTemplate.updateFirst(query, update, Area.class);
    }

    @Override
    public Object list(AreaQueryVo areaQueryVo) {
        PageResult pageResult = new PageResult ();
        pageResult.setPageNum (areaQueryVo.getPageNum ());
        pageResult.setPagesize (areaQueryVo.getPageSize ());

        //查询MongoDB
        PageRequest pageRequest = PageRequest.of (areaQueryVo.getPageNum () - 1, areaQueryVo.getPageSize (), Sort.by (Sort.Order.desc ("createdAt")));
        Criteria criteria = new Criteria();
        if (StringUtils.isNotBlank (areaQueryVo.getAreaName ())) {
            criteria.and ("areaName").is (areaQueryVo.getAreaName ());
        }
        if (StringUtils.isNotBlank (areaQueryVo.getUsername ())) {
            criteria.and ("username").is (areaQueryVo.getUsername ());
        }
        Query query = new Query (criteria).with (pageRequest);
        List<AreaQueryResult> areaQueryResults = mongoTemplate.find(query, AreaQueryResult.class);
        Query queryTotal =new Query (criteria);
        pageResult.setTotal (mongoTemplate.count (queryTotal, AreaQueryResult.class));
        if (CollectionUtils.isEmpty (areaQueryResults)) {
            return pageResult;
        }
        pageResult.setItems(areaQueryResults);
        return pageResult;
    }

    @Override
    public Object listAll() {
        Query queryTotal =new Query ();
        List<Area> areas = mongoTemplate.find (queryTotal, Area.class);
        return areas;
    }


}
