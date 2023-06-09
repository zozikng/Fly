<template>
  <div class="map">
    <div class="area">
      <el-button v-if="isShowArea===true" @click="showArea" type="success" icon="el-icon-remove-outline" size="mini">
        显示围栏
      </el-button>
      <el-button v-if="isShowArea===false" @click="cancleShowArea" type="warning" icon="el-icon-remove-outline"
                 size="mini"
      >
        取消围栏
      </el-button>
    </div>
    <div class="drowPath" v-if="pathList.length">
      <el-button
        v-show="getNaviStatus === 'stop' || navgtrEnd"
        type="primary"
        icon="el-icon-video-play"
        @click="startNavgtr"
        size="mini"
      >开始回放
      </el-button
      >
      <el-button
        v-show="getNaviStatus === 'moving'"
        type="info"
        icon="el-icon-video-pause"
        @click="pauseNavgtr"
        size="mini"
      >暂停回放
      </el-button
      >
      <el-button
        v-show="getNaviStatus === 'pause' && !navgtrEnd"
        type="success"
        icon="el-icon-video-play"
        @click="resumeNavgtr"
        size="mini"
      >继续回放
      </el-button
      >
    </div>
    <div class="reDrow">
      <el-button
        v-show="getNaviStatus == 'moving' && !navgtrEnd"
        type="primary"
        icon="el-icon-video-play"
        @click="reStartNavgtr"
        size="mini"
      >重新回放
      </el-button
      >
    </div>
    <div class="speed">
      <el-slider
        v-show="getNaviStatus == 'moving' && !navgtrEnd"
        v-model="speed"
        vertical
        height="200px"
        @change="setSpeed"
        :max="1500"
        :min="0"
      >
      </el-slider>
    </div>

    <!-- popover 弹出框 -->
    <el-popover placement="bottom" width="350" trigger="click">
      <el-table :data="pathList">
        <el-table-column label="路线名称" align="center" key="pathName" prop="pathName"/>
        <el-table-column label="创建时间" align="center" key="createdAt" prop="createdAt">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.createdAt) }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="deleteHistoryPath(scope.row)"
            >删除
            </el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-refresh-right"
              @click="getHistoryPathDetails(scope.row)"
            >回放
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        layout="prev, pager, next"
        v-show="total>0"
        :total="total"
        small
        :page-size="2"
        :pager-count="5"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getHistoryPathList"
      />
      <el-button
        class="reference"
        slot="reference"
        type="primary"
        icon="el-icon-map-location"
        size="mini  "
        @click="getHistoryPathList()"
      >巡航历史
      </el-button>
    </el-popover>

    <div class="canclePlan">
      <el-button
        v-show="isReView"
        type="primary"
        icon="el-icon-circle-close"
        @click="canclePlanPath"
        size="mini"
      >取消计划
      </el-button
      >
    </div>
    <!-- popover 弹出框 -->
    <el-popover placement="bottom" width="350" trigger="click">
      <el-table :data="planList">
        <el-table-column label="计划名称" align="center" key="pathName" prop="planName"/>
        <el-table-column label="创建时间" align="center" key="createdAt" prop="createdAt">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.createdAt) }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="deletePlanPath(scope.row)"
            >删除
            </el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-refresh-right"
              @click="showPlanPathDetails(scope.row)"
            >查看
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        layout="prev, pager, next"
        v-show="planTotal>0"
        :total="planTotal"
        small
        :pager-count="5"
        :page-size="2"
        :page.sync="planQueryParams.pageNum"
        :limit.sync="planQueryParams.pageSize"
        @pagination="getPlanPathList"
      />
      <el-button
        class="referencePlan"
        slot="reference"
        type="primary"
        icon="el-icon-s-claim"
        size="mini"
        @click="getPlanPathList"
      >计划列表
      </el-button>
    </el-popover>


    <!-- 地图容器 -->
    <div id="container"></div>
  </div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader'
import axios from 'axios'
import { listDrone, getDrone, delDrone, addDrone, updateDrone } from '@/api/system/fly/drone'
import { historyPathList, uploadHistoryPath, historyPathQuery, deleteHistoryPath } from '@/api/system/fly/historyPath'
import { planPathList, uploadPlanPath, planPathQuery, deletePlanPath } from '@/api/system/fly/planPath'
import { areaListAll } from '@/api/system/fly/area'

export default {
  name: 'playbackmap',
  data() {
    return {
      map: null, // 地图实例
      pathSimplifierIns: null, // 巡航路线实例
      planPathSimplifierIns: null, // 巡航路线实例
      navgtr: null, // 巡航器实例
      navgtrEnd: false, // 本轮巡航结束 结束为 true
      infoWindow: null, // 信息窗体实例
      // 巡航器、线路默认样式配置
      defaultRenderOpts: {
        zIndex: 200,
        renderAllPointsIfNumberBelow: 1,
        pathTolerance: 0,
        keyPointTolerance: 1, // 绘制中间节点的简化参数，小于0, 不绘制任何中间节点；默认设置。大于等于0，对简化过的绘制轨迹线做二次简化
        pathNavigatorStyle: {
          pathLinePassedStyle: {
            lineWidth: 5, // 巡航器经过路线宽度
            strokeStyle: '#66AA00',
            borderWidth: 1,
            borderStyle: '#eeeeee',
            dirArrowStyle: true
          }
        },
        pathLineStyle: {
          lineWidth: 5, // 轨迹宽度
          strokeStyle: '#1662fa',
          dirArrowStyle: true
        },
        keyPointStyle: {
          radius: 4, // 路径点大小
          fillStyle: '#576d93',
          lineWidth: 1,
          strokeStyle: '#eeeeee'
        }
      },// 巡航器、线路默认样式配置
      isOpeninfoWindow: false,//是否打开信息窗口
      //查询列表参数
      queryParams: {
        pageNum: 1,
        pageSize: 3,
        droneObjectId: null,
        droneId: null,
        droneName: null,
        pathName: null
      },
      pathList: [],//路线列表
      total: 0,
      drone: null,//无人机
      convertvarLngLats: null,//转换地址用的
      dronePath: [], //无人机显示路径路径
      speed: 50,//无人机速度
      planQueryParams: {
        pageNum: 1,
        pageSize: 3,
        planName: null,
        droneObjectId: null
      },
      planList: [],//路线列表
      planTotal: 0,
      isReView: false,
      planPath: {//计划的路径
        planName: null,
        path: [],
        droneObjectId: null
      },
      isShowArea: true,//是否展示围栏
      rePloygons: [],//禁飞区集合
      rePloygon: null//禁飞区
    }
  },

  computed: {
    getNaviStatus() {
      if (this.navgtr) {
        return this.navgtr.getNaviStatus()
      }
    }

  },
  created() {
    this.initMap()
  },
  //离开页面清除定时器和地图
  beforeDestroy() {
    this.map && this.map.destroy()
  },
  mounted() {

    this.initMap() //初始化地图
    // this.generateDroneData(); //生成无人机位置数据
    this.drone = this.$route.query.row
    this.queryParams.droneObjectId = this.drone.id
    if (this.drone === null || this.queryParams.droneObjectId === undefined) {
      this.$tab.closePage()
    }
    console.log(this.drone)
  },

  methods: {
    initMap() {
      window._AMapSecurityConfig = {
        securityJsCode: '205f1f075adc22848bd1f36a36f215c0'
      } //加密，根据高德key要求加上
      AMapLoader.load({
        key: 'c589afd92be904044d680df23a7bc9a6',
        version: '2.0',
        plugins: ['AMap.InfoWindow', 'AMap.Polyline', 'AMap.Polygon', 'AMap.OverView', 'AMap.CircleMarker', 'AMap.MoveAnimation', 'AMap.Autocomplete', 'AMap.PlaceSearch', 'AMap.Scale', 'AMap.OverView',
          'AMap.ToolBar', 'AMap.MapType', 'AMap.PolyEditor', 'AMap.CircleEditor', 'AMap.MarkerClusterer'], // 需要使用的的插件列表
        AMapUI: {
          // 是否加载 AMapUI，缺省不加载
          version: '1.1',
          plugins: ['control/BasicControl'] // 需要加载的 AMapUI ui插件
        }
      }).then((AMap) => {
        this.map = new AMap.Map('container', {
          center: [111.670258, 29.049257],
          resizeEnable: true,
          zoom: 16,
          viewMode: '2D'    //是否为3D地图模式
        })
        this.map.addControl(new AMap.Scale())
        //加载BasicControl，loadUI的路径参数为模块名中 'ui/' 之后的部分
        AMapUI.loadUI(['control/BasicControl'], (BasicControl) => {
          //图层切换控件
          this.map.addControl(new BasicControl.LayerSwitcher({
            position: 'rb'//right top，右上角
          }))
        })
      }).catch((e) => {
        console.log(e)
      })

    },
    /**
     获取历史路径
     *
     */
    getHistoryPathList() {
      historyPathList(this.queryParams).then(response => {
        console.log(response)
        this.pathList = response.items
        this.total = response.total
      })
      console.log(this.pathList)
    },
    /** 删除按钮操作 */
    deleteHistoryPath(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('确认删除路径名称为"' + row.pathName + '"的路径吗？').then(function() {
        return deleteHistoryPath(ids)
      }).then(() => {
        this.getHistoryPathList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {
      })
    },
    /**
     * 查询详细轨迹
     */
    getHistoryPathDetails(row) {
      const ids = row.id
      historyPathQuery(ids).then((res => {

        if (res.code === 200) {
          this.dronePath = res.data

          // if (this.isPlayBack===false) {
          //   this.isPlayBack = true

          this.drawNavgtrPath(this.dronePath.path)
          // }else{
          //   this.$message({
          //     type: 'warning',
          //     message: '请取消上一条轨迹回放后再试'
          //   })
          // }
        }
      }))
      console.log(this.pathList)
    },
    // 开始巡航
    startNavgtr() {
      this.navgtr.start() // 开始
      console.log(this.navgtr.getNaviStatus())
      this.navgtrEnd = false
    },
    // 停止巡航
    pauseNavgtr() {
      this.navgtr.pause() // 暂停
      console.log(this.navgtr.getNaviStatus())
    },
    // 继续巡航
    resumeNavgtr() {
      this.navgtr.resume() // 继续
      console.log(this.navgtr.getNaviStatus())
      this.navgtr
    },
    //重新巡航
    reStartNavgtr() {
      this.navgtr.start()
      this.navgtrEnd = false
    },
    cancelNavgtr() {
      this.isPlayBack = false
      this.clearNavgtr()
    },
    //清除巡航器
    clearNavgtr() {
      this.pathSimplifierIns = null
      this.navgtr = null // 取消
    },
    // 画路径
    drawNavgtrPath(dataList) {
      const that = this
      AMapUI.load(['ui/misc/PathSimplifier'], (PathSimplifier) => {
        if (!that.pathSimplifierIns) {
          that.pathSimplifierIns = new PathSimplifier({
            zIndex: 100,
            map: that.map, // 所属的地图实例
            getPath: (pathData, pathIndex) => {
              const lnglatList = []
              for (const item of pathData) {
                lnglatList.push([item.lng, item.lat])
              }
              // 返回轨迹数据中的节点坐标信息
              return lnglatList
            },
            getHoverTitle: (pathData, pathIndex, pointIndex) => {

              if (pointIndex >= 0) {
                // point
                return `
                  历史轨迹${that.dronePath.pathName}-${pointIndex + 1}测量点：<br/>
                  高度：${pathData[pointIndex].altitude}<br/>
                  速度：${pathData[pointIndex].speed}<br/>
                  方向：${pathData[pointIndex].direction}<br/>
                `
              }
              // path
              return `历史轨迹：${that.dronePath.pathName}共${pathData.length}个测量点`
            },
            autoSetFitView: true,
            renderOptions: that.defaultRenderOpts // 巡航器、线路默认样式配置
          })
          // 创建信息窗体
          //创建信息窗口
          that.infoWindow = new AMap.InfoWindow({
            // autoMove: true,
            closeWhenClickMap: true,
            offset: new AMap.Pixel(0, -30)
          })
        }

        // 设置数据
        that.pathSimplifierIns.setData([dataList])

        // 对第一条线路（即索引 0）创建一个巡航器
        that.navgtr = that.pathSimplifierIns.createPathNavigator(0, {
          loop: false, // 循环播放
          speed: 20, // 巡航速度，单位千米/小时
          pathNavigatorStyle: {
            width: 45,
            height: 45,
            content: PathSimplifier.Render.Canvas.getImageContent(require('@/assets/drone/drone.png')), // 自定义巡航器样式
            strokeStyle: null,
            fillStyle: null
            //经过路径的样式
            // pathLinePassedStyle: {
            //   lineWidth: 2,
            //   strokeStyle: 'orange',//轨迹线的颜色
            // },
          }
        })
        // 打开信息窗体
        // that.infoWindow.open(that.map, that.navgtr.getPosition());
        // 设置信息窗体内容

        that.pathSimplifierIns.on('pathClick pointClick', function() {
          console.log(that.navgtr.getNaviStatus())
          if (that.navgtr.getNaviStatus() === 'moving') {
            that.isOpeninfoWindow = true
            that.infoWindow.open(that.map, that.navgtr.getPosition())
            that.infoWindow.setPosition(that.navgtr.getPosition())
          }
          //打开信息窗口
          // that.infoWindow.setContent(`<B>${that.dronePath.droneName}</B> </br><B>速度：</B>   ${point.speed}   km/h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          //                                   <B>方向：</B> ${point.direction} 度 <br/>
          //                                   <B>高度：</B>   ${point.altitude}   m`)
        })

        // 监听巡航器
        that.navgtr.on('move', function() {
          // 此处不能用箭头函数否则会改变this指向
          let idx = this.getCursor().idx // 走到了第几个点
          let point = dataList[idx]
          if (that.isOpeninfoWindow) {
            that.infoWindow.setPosition(that.navgtr.getPosition())
            that.infoWindow.setContent(`<B>${that.dronePath.droneName}</B> </br><B>速度：</B>   ${point.speed}   km/h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <B>方向：</B> ${point.direction} 度 <br/>
                                            <B>高度：</B>   ${point.altitude}   m`)
          }
          // 通过 监听判断巡航器是否走到最后一个点来确定本轮结束
          if (idx + 1 === dataList.length) {
            that.navgtrEnd = true
          }
        })
      })
    },
    /**
     * 调整速度
     */
    setSpeed() {
      if (this.navgtr) {
        this.navgtr.setSpeed(this.speed)
      }
    },
    /**
     获取计划路径
     *
     */
    getPlanPathList() {
      this.planQueryParams.droneObjectId = this.drone.id
      planPathList(this.planQueryParams).then(response => {
        console.log(response)
        this.planList = response.items
        this.planTotal = response.total
      })
    },

    /** 删除按钮操作 */
    deletePlanPath(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('确认删除路径名称为"' + row.planName + '"的路径吗？').then(function() {
        return deletePlanPath(ids)
      }).then(() => {
        this.getPlanPathList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {
      })
    },

    canclePlanPath() {
      this.isReView = false
      this.planPath = null
      this.planPathSimplifierIns.setData([])
    },
    /**
     * 展示计划路线
     * @param row
     */
    showPlanPathDetails(row) {
      const ids = row.id
      planPathQuery(ids).then((res => {
        if (res.code === 200) {
          this.isReView = true
          this.planPath = res.data
          this.drawPlanPath(this.planPath)
        }
      }))
    },
    drawPlanPath(plan) {
      const that = this
      AMapUI.load(['ui/misc/PathSimplifier'], (PathSimplifier) => {
        if (!that.planPathSimplifierIns) {
          that.planPathSimplifierIns = new PathSimplifier({
            zIndex: 100,
            map: that.map, // 所属的地图实例
            getPath: (pathData, pathIndex) => {
              const lnglatList = []
              for (const item of pathData) {
                lnglatList.push([item.lng, item.lat])
              }
              // 返回轨迹数据中的节点坐标信息
              return lnglatList
            },
            getHoverTitle: (pathData, pathIndex, pointIndex) => {

              if (pointIndex >= 0) {
                // point
                return `
                  计划路线 ${plan.planName}-${pointIndex + 1}测量点：<br/>
                  高度：${pathData[pointIndex].altitude}<br/>
                  速度：${pathData[pointIndex].speed}<br/>
                  方向：${pathData[pointIndex].direction}<br/>
                `
              }
              // path
              return `计划路线${plan.planName}共${pathData.length}个测量点`
            },
            autoSetFitView: true,
            renderOptions: {
              zindex: 50,
              renderAllPointsIfNumberBelow: 1,
              pathTolerance: 0,
              keyPointTolerance: -1, // 绘制中间节点的简化参数，小于0, 不绘制任何中间节点；默认设置。大于等于0，对简化过的绘制轨迹线做二次简化
              pathLineStyle: {
                lineWidth: 4, // 轨迹宽度
                strokeStyle: 'rgba(250,197,22,0.71)',
                dirArrowStyle: true
              },
              keyPointStyle: {
                radius: 4, // 路径点大小
                fillStyle: '#576d93',
                lineWidth: 1,
                strokeStyle: '#eeeeee'
              }
            } // 巡航器、线路默认样式配置
          })
        }
        // 设置数据
        that.planPathSimplifierIns.setData([plan.path])
      })
    },
    showArea() {
      this.isShowArea = false
      areaListAll().then(res => {
        console.log(res)
        for (let i = 0; i < res.length; i++) {
          let data = res[i]
          console.log(data)
          // console.log(data)
          let points = []
          data.geoJsonPolygon.coordinates[0].coordinates.forEach(item => {
            points.push([item.x, item.y])
          })
          console.log(points)
          this.rePloygon = new AMap.Polygon({
            path: points,
            strokeColor: '#FF33FF',
            strokeWeight: 6,
            strokeOpacity: 0.2,
            fillOpacity: 0.4,
            fillColor: '#1791fc',
            zIndex: 50
          })
          this.rePloygons.push(this.rePloygon)
          this.map.add(this.rePloygon)
        }
      })
    },
    cancleShowArea() {
      this.isShowArea = true
      const that = this
      this.rePloygons.forEach(item => {
        item.hide()
        that.map.remove(item)
        item = null
      })
      // this.rePloygon.hide();
      // this.rePloygons=[];

    }

  }
}
</script>

<style lang="less" scoped>
.map {
  padding: 15px 10px;
  background: #fff;

  .area {
    position: absolute;
    z-index: 999;
    margin: 20px;
    right: 0;
  }

  .reference {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 60px;
    right: 0;
  }

  .referencePlan {
    position: absolute;
    z-index: 999;
    margin: 20px;
    left: 0;
  }

  .drowPath {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 100px;
    right: 0;
  }

  .canclePlan {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 60px;
    left: 0;
  }

  .reDrow {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 140px;
    right: 0;
  }

  .speed {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 180px;
    right: 0;
  }

  //.cancelDrow{
  //  position: absolute;
  //  z-index: 999;
  //  margin: 20px;
  //  margin-top: 140px;
  //  right: 0;
  //}
}

#container {
  width: 100%;
  height: 84.6vh;
  font-size: 10px;
}

///deep/.amap-marker-label,
/deep/ .amap-info-content {
  color: #62718a;
  font-size: 14px;
  padding: 0.75rem;
  border-radius: 0.25rem;
  background-color: #fff;
  border-width: 0;
  box-shadow: 0 2px 6px 0 rgba(114, 124, 245, 0.5);
}

///deep/.amap-copyright {
//  display: none !important;
//}
///deep/.amap-info-close {
//  display: none;
//}
///deep/.amap-icon img {
//  width: 30px;
//}
</style>

