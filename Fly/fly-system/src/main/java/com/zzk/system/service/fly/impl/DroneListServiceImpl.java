package com.zzk.system.service.fly.impl;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.zzk.common.utils.SecurityUtils;
import com.zzk.common.utils.StringUtils;
import com.zzk.system.domain.fly.Drone;
import com.zzk.system.domain.fly.Location;
import com.zzk.system.domain.vo.fly.DroneQueryVo;
import com.zzk.system.domain.vo.fly.PageResult;
import com.zzk.system.service.fly.IDroneListService;
import com.zzk.system.service.fly.IHistoryPathService;
import com.zzk.system.service.fly.IPlanPathService;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @description: 无人机飞行器列表业务层
 * @program: Fly
 * @author: zzk
 * @created: 2023/03/09 16:22
 */
@Service
public class DroneListServiceImpl implements IDroneListService {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Autowired
    private IPlanPathService planPathService;

    @Autowired
    private IHistoryPathService historyPathService;


    /**
     * 添加飞行器
     * @param drone
     */
    public Drone addDrone(Drone drone) {
        Criteria criteria = new Criteria();
        Query query = new Query(criteria.orOperator(
                Criteria.where("droneId").is(drone.getDroneId ()),
                Criteria.where("cardId").is (drone.getCardId ())));
        if (ObjectUtils.isNotEmpty (mongoTemplate.findOne (query, Drone.class))){
            return null;
        }


        drone.setId (ObjectId.get());
        //设置默认值
        Location location = new Location ();
        location.setLng ("111.668462");
        location.setLat ("29.050745");
        location.setDirection ("50");
        location.setSpeed ("0");
        location.setAltitude ("0");
        location.setDateTime (new Date ());
        drone.setUserId (SecurityUtils.getLoginUser().getUserId ().toString ());
        drone.setUsername (SecurityUtils.getLoginUser ().getUsername ());
        drone.setCurrentBatteryLevel ("100.00");
        drone.setLocation (location);
        drone.setSignal ("4");
        drone.setStatus ("0");
        drone.setCreatedAt(new Date ());
        drone.setUpdatedAt(new Date());

        return mongoTemplate.save (drone);

    }


    /**
     * 查询飞行器列表
     * @param droneQueryVo
     * @return
     */
    public Object queryDroneList(DroneQueryVo droneQueryVo) {
        PageResult pageResult = new PageResult ();
        pageResult.setPageNum (droneQueryVo.getPageNum ());
        pageResult.setPagesize (droneQueryVo.getPageSize ());

        //查询MongoDB
        PageRequest pageRequest = PageRequest.of (droneQueryVo.getPageNum () - 1, droneQueryVo.getPageSize (), Sort.by (Sort.Order.desc ("createdAt")));
        Criteria criteria = new Criteria();
        if (StringUtils.isNotBlank (droneQueryVo.getDroneName ())) {
            criteria.and ("droneName").is (droneQueryVo.getDroneName ());
        }
        if (StringUtils.isNotBlank (droneQueryVo.getModel ())) {
            criteria.and ("model").is (droneQueryVo.getModel ());
        }
        if (StringUtils.isNotBlank (droneQueryVo.getUsername ())) {
            criteria.and ("username").is (droneQueryVo.getUsername ());
        }
        if (StringUtils.isNotBlank (droneQueryVo.getUserId ())){
            criteria.and ("userId").is (droneQueryVo.getUserId ());
        }
        if (StringUtils.isNotBlank (droneQueryVo.getStatus ())){
            criteria.and ("status").is (droneQueryVo.getStatus ());
        }
        if (StringUtils.isNotBlank (droneQueryVo.getCurrentBatteryLevel ())){
            criteria.and ("currentBatteryLevel").is (droneQueryVo.getCurrentBatteryLevel ());
        }
        Query query = new Query (criteria).with (pageRequest);
        List<Drone> DroneList = mongoTemplate.find(query, Drone.class);
        Query queryTotal =new Query ();
        pageResult.setTotal (mongoTemplate.count (queryTotal,Drone.class));
        if (CollectionUtils.isEmpty (DroneList)) {
            return pageResult;
        }
        pageResult.setItems(DroneList);
        return pageResult;
    }


    /**
     * 根据id删除无人机
     * @param id
     */
    @Transactional(rollbackFor = Exception.class)
    public DeleteResult deleteDroneById(String id) {
        Query query = new Query(Criteria.where("id").is(new ObjectId(id)));

        DeleteResult deleteResult = mongoTemplate.remove (query, Drone.class);
        if (deleteResult.getDeletedCount ()>0){
            planPathService.deletePlanById (id);
            historyPathService.deleteHistoryPathById (id);
        }
        return deleteResult;
    }

    @Override
    public Object queryDroneById(String id) {
        Query query = new Query(Criteria.where("id").is(new ObjectId(id)));
        return mongoTemplate.findOne (query, Drone.class);
    }


    @Override
    public Drone queryDroneByDroneIdandCardId(String droneId, String cardId) {
        Query query = new Query(Criteria.where("droneId").is(droneId).and ("cardId").is (cardId));
        return mongoTemplate.findOne (query, Drone.class);
    }


    /**
     * 更新无人机信息
     * @param drone
     */
    public UpdateResult updateDrone(Drone drone) {
        Criteria criteria = new Criteria();
        Query exitQuery = new Query(criteria.orOperator(
                Criteria.where("droneId").is(drone.getDroneId ()),
                Criteria.where("cardId").is (drone.getCardId ())).and ("_id").ne (drone.getId ()));
        if (ObjectUtils.isNotEmpty (mongoTemplate.findOne (exitQuery, Drone.class))){
            return  UpdateResult.acknowledged (0,0L,null);
        }
        drone.setUpdatedAt(new Date());
        Query query = new Query(Criteria.where("_id").is(drone.getId ()));
        Update update = new Update()
                .set ("droneId",drone.getDroneId ())
                .set("droneName", drone.getDroneName ())
                .set("model", drone.getModel())
                .set ("cardId",drone.getCardId ())
                .set("userId", drone.getUserId ())
                .set("username", drone.getUsername())
                .set("currentBatteryLevel", drone.getCurrentBatteryLevel ())
                .set("location", drone.getLocation())
                .set("status", drone.getStatus())
                .set("updatedAt", drone.getUpdatedAt());
        return mongoTemplate.updateFirst(query, update, Drone.class);
    }

    @Override
    public boolean existsDrone(String droneId, String cardId) {

        Query query = new Query(Criteria.where("droneId").is(droneId)
                .and ("cardId")
                .is (cardId));
        Drone one = mongoTemplate.findOne (query, Drone.class);

        return ObjectUtils.isEmpty (one)? false:true;
    }


}
