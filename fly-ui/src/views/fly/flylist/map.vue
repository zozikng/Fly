<template>
  <div class="map">
    <div class="record">
      <el-button v-if="isRecording===0" @click="startRecord" type="success" icon="el-icon-edit" size="mini">记录路径
      </el-button>
      <el-button v-if="isRecording===1" @click="stopRecord" type="danger" icon="el-icon-remove-outline" size="mini">
        结束记录
      </el-button>
      <el-button v-if="isRecording===2" @click="uploadRecord" type="warning" icon="el-icon-remove-outline" size="mini">
        上传记录
      </el-button>
    </div>

    <div class="area">
      <el-button v-if="isShowArea===true" @click="showArea" type="primary" icon="el-icon-remove-outline" size="mini">
        显示围栏
      </el-button>
      <el-button v-if="isShowArea===false" @click="cancleShowArea" type="warning" icon="el-icon-remove-outline"
                 size="mini"
      >
        取消围栏
      </el-button>
    </div>
    <!-- popover 弹出框 -->
    <el-popover placement="bottom" width="350" trigger="click">
      <el-button
        size="mini"
        style="margin-bottom: 20px"
        type="primary"
        @click="JumpPlaybackMap()"
      >回放路径
      </el-button>
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
          </template>
        </el-table-column>
      </el-table>
      <pagination
        layout="prev, pager, next"
        v-show="total>0"
        :total="total"
        small
        :pager-count="5"
        :page-size="2"
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
              v-hasPermi="['system:drone:edit']"
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
    <div id="container"></div>
  </div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader'
import axios from 'axios'
import { listDrone, getDrone, delDrone, addDrone, updateDrone } from '@/api/system/fly/drone'
import { historyPathList, uploadHistoryPath, historyPathQuery, deleteHistoryPath } from '@/api/system/fly/historyPath'
import { deletePlanPath, planPathList, planPathQuery } from '@/api/system/fly/planPath'
import { areaListAll, areaQuery } from '@/api/system/fly/area'

export default {
  name: 'map',
  data() {
    return {
      map: null, //地图对象
      droneMarker: null, //无人机标记
      dronePath: [], //无人机显示路径路径
      polyline: null, //路径线
      isRecording: 0, //是否正在记录路径
      droneData: [], //无人机测试位置数据，后期无用
      index: 0, //无人机位置数据索引，测试数据，后期无用
      timer: null, //定时器
      drone: null,//无人机
      convertvarLngLats: null,//转换地址用的,现在用不上了
      infoWindow: null,//信息窗体
      isOpeninfoWindow: false,//是否打开窗口
      uploadPath: {//上传路径
        droneObjectId: null,//无人机对象id
        droneId: null,//无人机id
        droneName: null,//无人机名称
        cardId: null,//卡片id
        pathName: null,//路径名称
        startPoint: null,//起点
        endpoint: null,//终点
        path: [],//路径
        userId: null,//用户id
        userName: null,//用户名
        createAt: null//创建时间
      },
      queryParams: {
        pageNum: 1,
        pageSize: 3,
        droneObjectId: null,
        droneId: null,
        droneName: null,
        pathName: null
      },
      pathList: [],
      total: 0,
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
      rePloygon: null,//禁飞区
      first:false,//是否第一次请求
    }
  },
  created() {
    this.initMap()
  },
  mounted() {
    this.initMap() //初始化地图
    // this.generateDroneData(); //生成无人机位置数据
    this.generateDroneData2() //生成无人机位置数据
    this.getDroneData() //获取无人机数据
    this.drone = this.$route.query.row
    this.queryParams.droneObjectId = this.drone.id
    if (this.drone === null || this.queryParams.droneObjectId === undefined) {
      this.$tab.closePage()
    }
    console.log(this.drone)
    this.first=true
    console.log(this.first)
  },
  //离开页面清除定时器和地图
  beforeDestroy() {
    console.log(this.timer)
    clearInterval(this.timer)
    this.timer = null
    this.map && this.map.destroy()
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
          plugins: [] // 需要加载的 AMapUI ui插件
        }
      }).then((AMap) => {
        this.map = new AMap.Map('container', {
          center: [111.670258, 29.049257],
          resizeEnable: true,
          viewMode: '2D',    //是否为3D地图模式
          zoom: 16
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

    generateDroneData() {
      //生成10个随机位置点的测试数据，假设无人机初始位置为[116.397428, 39.90923]
      let base_log = 116.397428 //基准经度
      let base_lat = 39.90923 //基准纬度
      let radius = 1000 //半径，单位为米
      let radius_in_degrees = radius / 111300 //半径转换为度数
      for (let i = 0; i < 10; i++) {
        let u = Math.random() //生成0到1之间的随机数u
        let v = Math.random() //生成0到1之间的随机数v
        let w = radius_in_degrees * Math.sqrt(u)
        let t = 2 * Math.PI * v
        let x = w * Math.cos(t)
        let y = w * Math.sin(t)
        let longitude = y + base_log //生成随机经度
        let latitude = x + base_lat //生成随机纬度
        this.droneData.push([longitude, latitude]) //将随机位置点添加到数组中
      }
    },
    generateDroneData2() {
      var points = [
        [111.672, 29.042],
        [111.671, 29.041],
        [111.670, 29.042],
        [111.671, 29.043],
        [111.672, 29.043],
        [111.673, 29.042],
        [111.673, 29.041],
        [111.672, 29.040],
        [111.671, 29.040],
        [111.670, 29.041],
        [111.669, 29.042],
        [111.669, 29.043],
        [111.670, 29.044],
        [111.671, 29.044],
        [111.672, 29.044],
        [111.673, 29.043],
        [111.674, 29.042],
        [111.674, 29.041],
        [111.673, 29.040],
        [111.672, 29.039]
      ]
      this.droneData = points
    },
    // getDroneData() {
    //   //获取无人机数据的方法，这里假设每隔1秒获取一个位置点，并循环使用测试数据
    //   this.timer = setInterval(() => {
    //     let data = this.droneData[this.index] //获取当前位置点数据
    //     this.updateDroneMarker(data) //更新无人机标记位置
    //     if (this.isRecording) {
    //       this.updateDronePath(data) //更新无人机路径
    //     }
    //     this.index++ //更新索引值
    //     if (this.index >= this.droneData.length) {
    //       this.index = 0 //如果索引值超过测试数据长度，则重置为0
    //     }
    //   }, 1000)
    // },

    /**
     * 往后端获取数据
     */
    getDroneData() {
      //获取无人机数据的方法，这里假设每隔1秒获取一个位置点，并循环使用测试数据
      this.timer = setInterval(() => {
        const id = this.drone.id
        getDrone(id).then(response => {
          if (this.drone.location.dateTime !== response.data.location.dateTime||this.first) {
            this.first=false//避免无人机停机了还在不断请求
            this.drone = response.data
            // console.log(JSON.stringify(this.drone))
            if (this.drone.status === '4') {
              this.$message({
                duration: 1000,
                showClose: true,
                message: '你进入了禁飞区,请尽快飞离',
                type: 'error'
              })
            }
            let data = [this.drone.location.lng, this.drone.location.lat]//获取当前位置点数据
            //js的抓住异常
            // try {
            //   new AMap.convertFrom(data, 'gps', (status, result) => {
            //     if (result.info === 'ok') {
            //       this.convertvarLngLats = result.locations[0] // Array.<LngLat>
            //       this.drone.location.lng=this.convertvarLngLats.lng
            //       this.drone.location.lat=this.convertvarLngLats.lat
            //     }
            //   })
            // } catch (e) {
            //   console.log(e)
            // } finally {
            //   if (this.convertvarLngLats !== null) {
            //     data = [this.convertvarLngLats.lng, this.convertvarLngLats.lat]
            //     this.convertvarLngLats = null
            //   }
            // console.log(data)
            this.updateDroneMarker(data) //更新无人机标记位置
            if (this.isRecording === 1) {
              this.updateDronePath(data, this.drone) //更新无人机路径
            }
            // }
          }
        })

      }, 1500)
    },
    /**
     * 更新无人机位置
     * @param data
     */
    updateDroneMarker(data) {
      //更新无人机标记位置的方法
      if (!this.droneMarker) {
        //如果没有创建过无人机标记，则创建一个新的标记并添加到地图上
        this.droneMarker = new AMap.Marker({
          position: data,
          icon: new AMap.Icon({
            image: require('@/assets/drone/drone.png'),
            size: new AMap.Size(64, 64),  //图标大小
            imageSize: new AMap.Size(32, 32)

          }), //无人机图标，可以自定义
          map: this.map,
          offset: new AMap.Pixel(-16, -16),
          clickable: true,
          isCustom: true
        })
        //创建信息窗口
        this.infoWindow = new AMap.InfoWindow({
          closeWhenClickMap: true,
          autoMove: true,
          offset: new AMap.Pixel(0, -30)
        })
        this.map.setFitView(this.droneMarker) // 合适的视口
        this.droneMarker.on('click', () => {
          this.isOpeninfoWindow = true
          //打开信息窗口
          this.infoWindow.open(this.map, this.droneMarker.getPosition())
          this.infoWindow.setContent(`<B>${this.drone.droneName}</B> </br><B>速度：</B>   ${this.drone.location.speed}   km/h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <B>方向：</B> ${this.drone.location.direction} 度 <br/>
                                            <B>高度：</B>   ${this.drone.location.altitude}   m&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <B>电量：</B>   ${this.drone.currentBatteryLevel}   %`)
        })

      } else {
        //如果已经创建过无人机标记，则更新其位置
        // this.droneMarker.setPosition(data)
        this.droneMarker.moveTo(data, {
          duration: 1000,//移动时间，单位毫秒
          offset: new AMap.Pixel(-16, -16)//标记图标便宜量
        })
        if (this.isOpeninfoWindow) {
          this.infoWindow.setPosition(data)
          this.infoWindow.setContent(`<B>${this.drone.droneName}</B> </br><B>速度：</B>   ${this.drone.location.speed}   km/h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <B>方向：</B> ${this.drone.location.direction} 度 <br/>
                                            <B>高度：</B>   ${this.drone.location.altitude}   m&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <B>电量：</B>   ${this.drone.currentBatteryLevel}   %`)

        }

      this.map.setCenter(data) //将地图中心点设置为无人机位置
      }
    },
    /**
     * 更新无人机路径
     * @param data
     */
    updateDronePath(data, drone) {
      //更新无人机路径的方法
      this.dronePath.push(data) //将当前无人机位置添加到路径数组中

      if (!this.polyline) {
        //如果没有创建过路径线，则创建一个新的线并添加到地图上
        this.polyline = new AMap.Polyline({
          zIndex: 300,
          isOutline: true,
          path: this.dronePath,
          map: this.map,
          showDir: true,
          strokeColor: '#1af60a', // 线颜色--蓝色
          // strokeOpacity: 1,     //线透明度
          strokeWeight: 6, // 线宽
          strokeStyle: 'solid',//线样式
          lineJoin: 'round' // 折线拐点的绘制样式
        })
        this.uploadPath.droneObjectId = drone.id
        this.uploadPath.droneName = drone.droneName
        this.uploadPath.droneId = drone.droneId
        this.uploadPath.cardId = drone.cardId
        this.uploadPath.startPoint = drone.location
        this.uploadPath.path.push(drone.location)
      } else {
        //如果已经创建过路径线，则更新其路径
        this.polyline.setPath(this.dronePath)
        if (this.uploadPath === null) {
          this.uploadPath.droneObjectId = drone.id
          this.uploadPath.droneName = drone.droneName
          this.uploadPath.droneId = drone.droneId
          this.uploadPath.cardId = drone.cardId
          this.uploadPath.startPoint = drone.location
          this.uploadPath.path.push(drone.location)
        }

        this.uploadPath.endPoint = drone.location
        this.uploadPath.path.push(drone.location)
      }
    },
    startRecord() {
      //开始记录路径的方法
      this.isRecording = 1 //设置记录状态为true
    },
    stopRecord() {
      //结束记录路径的方法
      this.isRecording = 2 //设置记录状态为false
    },
    uploadRecord() {
      //上传路径
      this.$prompt('请输入上传路径名称便于查看，如果不上传点击取消', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^[\s\S]*.*[^\s][\s\S]*$/,
        center: true,
        inputErrorMessage: '请输入上传路径名称'
      }).then(({ value }) => {
        console.log(value)
        this.uploadPath.pathName = value
        this.$message({
          type: 'success',
          message: '上传历史路径名称[ ' + value + ']成功'
        })
        this.uploadData() //上传数据到后端
      }).catch((e) => {
        console.log(e)
        // this.$message({
        //   type: 'info',
        //   message: '取消输入'
        // })
        this.$confirm('是否继续记录', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
          center: true
        }).then(() => {
          this.$message({
            type: 'success',
            message: '继续!'
          })
          this.isRecording = 1
        }).catch(() => {
          this.$message({
            type: 'warning',
            message: '已取消记录'
          })
          this.isRecording = 0
          this.map.remove(this.polyline)
          this.dronePath = []
          this.polyline = null
          this.clearUploadPath()
        })
      })
    },
    clearUploadPath() {
      this.uploadPath.droneObjectId = null,//无人机对象id
        this.uploadPath.droneId = null,//无人机id
        this.uploadPath.droneName = null,//无人机名称
        this.uploadPath.cardId = null,//卡片id
        this.uploadPath.pathName = null,//路径名称
        this.uploadPath.startPoint = null,//起点
        this.uploadPath.endpoint = null,//终点
        this.uploadPath.path = [],//路径
        this.uploadPath.userId = null,//用户id
        this.uploadPath.userName = null,//用户名
        this.uploadPath.createAt = null//创建时间
    },
    uploadData() {
      //上传数据到后端的方法
      //使用axios或者其他方式发送请求到后端接口，这里假设后端接口为/drone/upload
      uploadHistoryPath(this.uploadPath).then((res) => {
        //处理响应结果
        if (res.code === 200) {
          //如果上传成功，提示用户并清空路径数组和线
          this.isRecording = 0
          this.map.remove(this.polyline)
          this.dronePath = []
          this.polyline = null
          this.clearUploadPath()
        } else {
          //如果上传失败，提示用户错误信息
          this.$message({
            type: 'error',
            message: res.message
          })
        }
      })
    },
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
    /** 跳转回放地图 */
    JumpPlaybackMap() {
      this.$router.push({ path: '/fly/flylist-map/playbackmap', query: { row: this.drone } })
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
            zIndex: 50,
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
              zindex: 4,
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

  .canclePlan {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 60px;
    left: 0;
  }

  .area {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 100px;
    right: 0;
  }

  .record {
    position: absolute;
    z-index: 999;
    margin: 20px;
    right: 0;
  }
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
