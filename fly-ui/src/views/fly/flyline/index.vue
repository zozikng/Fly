<template>
  <div class="map">
    <div class="tipserach">
      <el-input v-model="inputValue"
                placeholder="请输入您要查找的地区"
                id="tipInputId"
                prefix-icon="el-icon-search"
                size="mini"
      />
    </div>
    <div class="draw">
      <el-button v-if="isRecording===0 && isReView===false" @click="startRecord" type="success" icon="el-icon-edit" size="mini">绘制路径
      </el-button>
      <el-button v-if="isRecording===1 && isReView===false" @click="stopRecord" type="danger" icon="el-icon-remove-outline" size="mini">
        结束绘制
      </el-button>
      <el-button v-if="isRecording===2 && isReView===false" @click="uploadRecord" type="warning" icon="el-icon-remove-outline" size="mini">
        提交路径
      </el-button>
      <el-button v-if="isReView===true" @click="removePlanPathReView" type="warning" icon="el-icon-remove-outline" size="mini">
        结束查看
      </el-button>
    </div>
    <div class="reBack">
      <el-button
        v-show="isRecording===1"
        type="info"
        icon="el-icon-back"
        @click="removePlanOneSetp"
        size="mini"
      >回退一步
      </el-button>
    </div>
    <!-- popover 弹出框 -->
    <el-popover placement="bottom" width="350" trigger="click">
      <el-button
        size="mini"
        style="margin-bottom: 20px"
        type="primary"
        @click="JumpFlyList()"
      >去飞行
      </el-button>
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
              @click="getPlanPathDetails(scope.row)"
            >查看
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
        @pagination="getPlanPathList"
      />
      <el-button
        class="reference"
        slot="reference"
        type="primary"
        icon="el-icon-s-claim"
        size="mini"
        @click="getPlanPathList"
      >计划列表
      </el-button>
    </el-popover>

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

    <el-dialog :show-close="false" title="提交计划" :visible.sync="dialogFormVisible" width="350px" center>
      <el-form ref="form" :model="planPath" :rules="rules" :label-width="labelWidth">
        <el-form-item label="规划名称：" prop="planName" >
          <el-input v-model="planPath.planName"  autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="无人机：" prop="droneObjectId" >
          <el-select v-model="planPath.droneObjectId" placeholder="请选择无人机">
            <el-option
              v-for="item in droneList"
              :key="item.id"
              :label="item.droneName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancleUploadPlanData">取 消</el-button>
        <el-button type="primary" @click="uploadPlanData">确 定</el-button>
      </div>
    </el-dialog>
    <div id="container"></div>
  </div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader'
import proj4 from 'proj4'
import { planPathList, uploadPlanPath, planPathQuery, deletePlanPath } from '@/api/system/fly/planPath'
import { listDrone } from '@/api/system/fly/drone'
import { areaListAll } from '@/api/system/fly/area'


export default {
  name: 'index',
  data() {
    return {
      map: null, //地图对象
      planPath: {//计划的路径
        planName: null,
        path: [],
        droneObjectId:null,
      },
      location: {
        lat: null,
        lng: null
      },
      drowPlanPath: [],//用于绘制的路径
      markers: [],
      //用于提示搜索
      auto: null,//自动完成插件实例
      placeSearch: null,//地方搜索插件实例
      autoOptions: {//自动搜索绑定输入框id
        input: 'tipInputId'
      },
      inputValue: '',//搜索值
      isRecording: 0,//用于判断是否在绘制路径
      polyline: null,//绘制路径用
      drowPlan: null,//绘制计划的回调函数
      circleMarker: null,//用于回退路径
      convertvarLngLats: null,//用于坐标转换，这里用不上
      //查询列表参数
      queryParams: {
        pageNum: 1,
        pageSize: 3,
        planName: null
      },
      planList: [],//计划列表
      total: 0,//总数
      isReView:false,//是否回显
      dialogFormVisible:false,//上传窗口
      labelWidth:'100px',
      // 表单参数
      form: {},
      rules: {
        planName: [
          { required: true, message: '请输入规划名称', trigger: 'blur' },
          { min: 3, max: 12, message: '长度在 3 到 12 个字符', trigger: 'blur' }
        ],
        droneObjectId: [
          { required: true, message: '请选择无人机', trigger: 'change' }
        ],
      },
      dronetotal: 0,
      // 无人机列表表格数据
      droneList: [],
      droneTotal:0,
      droneQueryParams: {
        pageNum: 1,
        pageSize: 1000000,
      },
      isShowArea: true,//是否展示围栏
      rePloygons: [],//禁飞区集合
      rePloygon: null,//禁飞区
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
  },
  watch: {
    //输入新的值
    inputValue(newValue) {
      console.log(newValue)
      if (newValue != null) {
        this.placeSearch.search(newValue)
      }
    }
  },
  methods: {
    initMap() {
      window._AMapSecurityConfig = {
        securityJsCode: '205f1f075adc22848bd1f36a36f215c0'
      } //加密，根据高德key要求加上
      AMapLoader.load({
        key: 'c589afd92be904044d680df23a7bc9a6',
        version: '2.0',
        plugins: ['AMap.InfoWindow', 'AMap.Polyline', 'AMap.Polygon', 'AMap.OverView','AMap.CircleMarker', 'AMap.MoveAnimation', 'AMap.AutoComplete', 'AMap.PlaceSearch', 'AMap.Scale', 'AMap.OverView',
          'AMap.ToolBar', 'AMap.MapType', 'AMap.PolyEditor', 'AMap.CircleEditor', 'AMap.MarkerClusterer'], // 需要使用的的插件列表
        AMapUI: {
          // 是否加载 AMapUI，缺省不加载
          version: '1.1',
          plugins: ['control/BasicControl'] // 需要加载的 AMapUI ui插件
        }
      }).then((AMap) => {
        this.map = new AMap.Map('container', {
          center: [111.670258,29.049257],
          resizeEnable: true,
          zoom: 16,
          viewMode: '2D'    //是否为3D地图模式
        })

        //加载BasicControl，loadUI的路径参数为模块名中 'ui/' 之后的部分
        AMapUI.loadUI(['control/BasicControl'], (BasicControl) => {
          //图层切换控件
          this.map.addControl(new BasicControl.LayerSwitcher({
            position: 'rb'//right top，右上角
          }))
        })
        this.map.addControl(new AMap.Scale())
        //搜索地址空间
        this.auto = new AMap.AutoComplete(this.autoOptions)
        this.placeSearch = new AMap.PlaceSearch({
          map: this.map
        })
        console.log(this.placeSearch)
        this.auto.on('select', this.select)
      }).catch((e) => {
        console.log(e)
      })

    },
    /**
     * 关键词搜索
     * @param e
     */
    select(e) {
      console.log(e)
      this.placeSearch.setCity(e.poi.adcode)
      this.placeSearch.search(e.poi.name) //关键字查询查询
      this.map.setZoom(10, true)
    },

    startRecord() {
      //开始记录路径的方法
      this.isRecording = 1 //设置记录状态为true
      // 给地图添加点击事件地图点击事件
      this.drowPlan = (e) => {
        const position = [e.lnglat.getLng(), e.lnglat.getLat()]
        this.drawCircleMarker(position)
        this.drawPolyline(position)
      }

      this.map.on('click', this.drowPlan)
    },
    stopRecord() {
      //结束记录路径的方法
      this.isRecording = 2 //设置记录状态为false
      this.map.off('click', this.drowPlan)
    },
    /**
     * 上传计划
     */
    uploadRecord() {

      this.dialogFormVisible=true;
      this.getDroneList()

    },
    clearUploadPlanPath() {
      this.planPath.planName = null,//路径名称
        this.planPath.path = []//路径
      this.drowPlanPath = []//清空
    },
    cancleUploadPlanData(){
      this.dialogFormVisible=false
      this.$confirm('是否继续绘制路径', '提示', {
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
        this.map.on('click', this.drowPlan)
      }).catch(() => {
        this.$message({
          type: 'warning',
          message: '已取消记录'
        })
        this.isRecording = 0

        this.polyline = null
        this.clearUploadPlanPath()
        this.map.clearMap()  	// API提供的清除函数（删除地图上所有的覆盖物）
      })
    },
    uploadPlanData() {
      // var converPath=[]
      // for (let i = 0; i < this.planPath.path.length; i++) {
      //   // new AMap.convertFrom(this.planPath.path[i], 'gps', (status, result) => {
      //   //   if (result.info === 'ok') {
      //   //     this.convertvarLngLats = result.locations[0] // Array.<LngLat>
      //     // }
      //   // })
      //   converPath.push(i+"  "+this.planPath.path[i][0]+"  "+this.planPath.path[i][1]);
      //
      // }
      // console.log(converPath)
      // this.$notify({
      //   title: '上传记录未完成，您可以复制您绘制的路径用作无人机模拟数据,到坐标转换工具去转换为北斗的：',
      //   message: converPath,
      //   duration: 0
      // });

      //上传数据到后端的方法
      //使用axios或者其他方式发送请求到后端接口，这里假设后端接口为/drone/upload
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.planPath.droneObjectId != null) {
            this.dialogFormVisible=false
            uploadPlanPath(this.planPath).then((res) => {
              //处理响应结果
              if (res.code === 200) {
                this.$message({
                  type: 'success',
                  message: '上传计划名称[ ' + this.planPath.planName + ']成功'
                })
                //如果上传成功，提示用户并清空路径数组和线
                this.isRecording = 0
                this.polyline = null
                this.clearUploadPlanPath()
                this.map.clearMap()	// API提供的清除函数（删除地图上所有的覆盖物）

              } else {
                //如果上传失败，提示用户错误信息
                this.$message({
                  type: 'error',
                  message: res.message
                })
              }
            })
          }
        }
      })

    },
    /**
     获取计划路径
     *
     */
    getPlanPathList() {
      planPathList(this.queryParams).then(response => {
        console.log(response)
        this.planList = response.items
        this.total = response.total
      })
      console.log(this.planList)
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

    /**
     * 绘制路径
     * @param position
     */
    drawCircleMarker(position) {
      // 圆点配置项
      const options = {
        center: position, // 圆点位置（经纬度）
        radius: 3,
        strokeColor: '#FFF',
        strokeWeight: 1,
        strokeOpacity: 0.5,
        fillColor: '#5555ff',
        fillOpacity: 1,
        zIndex: 99,
        bubble: true,
        cursor: 'pointer',
        clickable: true
      }
      this.circleMarker = new AMap.CircleMarker(options)
      this.markers.push(this.circleMarker)
      this.map.add(this.circleMarker) // 往地图中添加圆点实例
      // this.map.add(new AMap.Marker({
      //   position: position,
      // })) // 往地图中添加圆点实例
    },
    /**
     * 绘制路径
     * @param path
     */
    drawPolyline(path) {
      console.log(this.polyline)
      //绘制路径
      if (!this.polyline) {
        const options = {
          strokeWeight: 3, // 轮廓线宽度
          strokeColor: '#fa8c16', // 线条颜色
          strokeOpacity: 1, // 轮廓线透明度0表示完全透明，1表示不透明。默认为0.5
          lineJoin: 'round', // 折线拐点连接处样式
          lineCap: 'round', // 折线两端线帽的绘制样式
          showDir: true // 是否延路径显示白色方向箭头
        }
        this.polyline = new AMap.Polyline(options)
        this.map.add(this.polyline)
      }
      // 清除地图覆盖物后需要重新挂载折线实例
      if (!this.polyline._map) {
        this.map.add(this.polyline)
      }
      this.drowPlanPath.push(path)

      const location ={ lng:path[0],lat:path[1]}
      this.planPath.path.push(location) // 点击一次把路径点 push 到 this.polylinePath 数组中
      this.polyline.setPath(this.drowPlanPath) // 把路径点列表传给 setPath()
    },

    /**
     * 退回
     */
    removePlanOneSetp() {
      if (this.drowPlanPath.length >= 1) {
        this.map.remove(this.markers[this.markers.length - 1])
        this.markers.pop(this.markers.length - 1)
        this.planPath.path.pop(this.planPath.path.length - 1)
        this.drowPlanPath.pop(this.drowPlanPath - 1)
        this.polyline.setPath(this.drowPlanPath)
      } else if (this.markers.length >= 1) {
        this.map.remove(this.markers[this.markers.length - 1])
        this.markers.pop[this.markers.length - 1]
      }
    },
    /**
     * 查询详细轨迹
     */
    getPlanPathDetails(row) {
      if (this.isRecording === 1 || this.isRecording === 2) {
        this.$message({
          type: 'warning',
          message: '请结束你的绘制再查看！！！'
        })
        return
      }

      const ids = row.id
      planPathQuery(ids).then((res => {
        if (res.code === 200) {
          this.isReView=true;
          let data = res.data
          this.clearUploadPlanPath()
          this.map.clearMap();
          for (let i = 0; i < data.path.length; i++) {
            this.drawCircleMarker([data.path[i].lng, data.path[i].lat])
            this.drawPolyline([data.path[i].lng, data.path[i].lat])
            console.log(data)
          }
        }
      }))
    },
    /**
     * 清除查看
     */
    removePlanPathReView(){
      this.isReView=false;
      this.clearUploadPlanPath();
      this.map.clearMap();
    },

    /**
     * 去飞行
     * @constructor
     */
    JumpFlyList() {
      this.$router.push({ path: '/fly/flylist' })
    },
    /** 查询无人机列表列表 */
    getDroneList() {
      this.loading = true
      listDrone(this.droneQueryParams).then(response => {
        this.droneList = response.items
        this.droneTotal = response.total
        this.loading = false
      })
      console.log(this.droneList)
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

  .draw {
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

  .reBack {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 140px;
    right: 0;
  }
  .area {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 100px;
    right: 0;
  }


  .tipserach {
    position: absolute;
    z-index: 999;
    margin: 20px;
    left: 0;
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
