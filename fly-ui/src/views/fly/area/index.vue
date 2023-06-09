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
      <el-button v-if="isRecording===0 && isReView===false" @click="drawRectangle" type="success" icon="el-icon-edit" size="mini">绘制围栏
      </el-button>
      <el-button v-if="isRecording===1 && isReView===false" @click="stopDrow" type="danger"
                 icon="el-icon-remove-outline" size="mini"
      >
        结束绘制
      </el-button>
      <el-button v-if="isRecording===2 && isReView===false" @click="uploadArea" type="warning"
                 icon="el-icon-remove-outline" size="mini"
      >
        提交围栏
      </el-button>
      <el-button v-if="isReView===true" @click="removeReView" type="warning" icon="el-icon-remove-outline"
                 size="mini"
      >
        结束查看
      </el-button>
    </div>
    <div class="edit">
      <el-button v-if="isRecording===1 && isReView===false" @click="editRectangle" type="primary" icon="el-icon-s-check" size="mini">编辑围栏
      </el-button>
    </div>
    <div class="cancel">
      <el-button v-if="isRecording===1 && isReView===false" @click="cancelRectangle" type="warning" icon="el-icon-caret-left" size="mini">取消编辑
      </el-button>
    </div>
    <div class="reBack">
      <el-button v-if="isRecording===1 && isReView===false" @click="reBackRectangle" type="info" icon="el-icon-back" size="mini">重新绘制
      </el-button>
    </div>
    <!-- popover 弹出框 -->
    <el-popover placement="bottom" width="350" trigger="click">
      <el-button
        size="mini"
        style="margin-bottom: 20px"
        type="primary"
        @click="showAllArea()"
      >显示所有围栏
      </el-button>
      <el-table :data="areaList">
        <el-table-column label="禁飞区名称" align="center" key="areaName" prop="areaName"/>
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
              @click="deleteArea(scope.row)"
              v-hasPermi="['fly:area:remove']"
            >删除
            </el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-refresh-right"
              @click="getAreaDetails(scope.row)"
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
        @pagination="getAreaList"
      />
      <el-button
        class="reference"
        slot="reference"
        type="primary"
        icon="el-icon-s-claim"
        size="mini"
        @click="getAreaList"
      >围栏列表
      </el-button>
    </el-popover>
    <div id="container"></div>
  </div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader'
import { areaList, uploadArea, areaQuery, deleteArea, areaListAll } from '@/api/system/fly/area'
import { deletePlanPath, planPathList, planPathQuery } from '@/api/system/fly/planPath'
import item from '@/layout/components/Sidebar/Item.vue'


export default {
  name: 'index',
  data() {
    return {
      map: null, //地图对象
      //用于提示搜索
      auto: null,//自动完成插件实例
      placeSearch: null,//地方搜索插件实例
      autoOptions: {//自动搜索绑定输入框id
        input: 'tipInputId'
      },
      inputValue: '',//搜索值
      polygonItems:[],//绘制对象
      polyEditors: [],// 新增数据=>所有编辑对象数组
      mouseTool: null,//鼠标工具
      polygonStyle:{
        //polygon：绘制多边形【线段：polyline;矩形：rectangle;圆：circle】
        strokeColor: 'red',
        strokeOpacity: 0.4,
        strokeWeight: 6,
        fillColor: '#1791fc',
        fillOpacity: 0.2,
        // strokeStyle还支持 solid
        strokeStyle: 'solid'
        // strokeDasharray: [30,10],
      },//多边绘图样式
      drowAreaEvent: null,//绘制是事件
      queryParams: {//查询参数
        pageNum: 1,
        pageSize: 3,
        planName: null
      },
      areaList: [],//禁飞区列表
      total: 0,//总数
      isRecording: 0,//用于判断是否在绘制路径
      isReView: false,//是否回显
      area:{//禁飞区
        areaName: String,
        geoJsonPolygon: {
          coordinates: []
        },
      },
      rePloygon:null,//用于查看的
      rePloygons: [],//禁飞区集合
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
        plugins: ['AMap.InfoWindow', 'AMap.Polyline', 'AMap.Polygon', 'AMap.OverView', 'AMap.CircleMarker', 'AMap.MoveAnimation', 'AMap.AutoComplete', 'AMap.PlaceSearch', 'AMap.Scale', 'AMap.OverView',
          'AMap.ToolBar', 'AMap.MapType', 'AMap.PolyEditor', 'AMap.CircleEditor', 'AMap.MarkerClusterer', 'AMap.MouseTool'], // 需要使用的的插件列表
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

    // 绘制多边形
    drawRectangle() {
      this.isRecording = 1 //设置记录状态为true
      const This = this
      if (!this.mouseTool) {
        this.mouseTool = new AMap.MouseTool(this.map)
        this.mouseTool.polygon(this.polygonStyle)
        this.drowAreaEvent = (event) => {
          // event.obj 为绘制出来的覆盖物对象
          let polygonItem = event.obj

          this.polygonItems.push(event.obj)
          this.polyEditor = new AMap.PolyEditor(this.map, event.obj)
          this.polyEditors.push(This.polyEditor)
          this.cancelRectangle()
          console.log(this.polyEditors.length)
          this.mouseTool.close();
        }
        this.mouseTool.on('draw', this.drowAreaEvent)
        this.mouseTool.on('rightclick',)
        console.log("开了"+this.drowAreaEvent)
      }
    },
    stopDrow() {
      //结束记录路径的方法
      this.isRecording = 2 //设置记录状态为false
      this.mouseTool.close();
      console.log("关了"+this.drowAreaEvent)
    },
    // 编辑围栏
    editRectangle() {
      if (this.polyEditors) {
        this.polyEditors.forEach(item => {
          item.open()
        })
      }
    },
    // 取消编辑状态
    cancelRectangle() {
      if (this.polyEditors) {
        console.log(this.polyEditors)
        this.polyEditors.forEach(item => {
          item.close()
        })//新增
      }
    },
    /**
     * 回退一个
     */
    reBackRectangle() {
      this.cancelRectangle()
      this.mouseTool.polygon(this.polygonStyle)
      this.map.remove(this.polygonItems[this.polygonItems.length - 1])
      this.polygonItems.pop(this.polygonItems.length - 1)
      this.map.remove(this.polyEditors[this.polyEditors.length - 1])
      this.polyEditors.pop(this.polyEditors.length - 1)
    },

    /**
     * 上传围栏
     */
    uploadArea() {
      //上传路径
      this.$prompt('请输入上传围栏名称便于查看，如果不上传点击取消', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^[\s\S]*.*[^\s][\s\S]*$/,
        center: true,
        inputErrorMessage: '请输入上传围栏名称'
      }).then(({ value }) => {
        console.log(value)
        this.area.areaName = value
        this.$message({
          type: 'success',
          message: '上传围栏名称[ ' + value + ']成功'
        })
        this.uploadData() //上传数据到后端
      }).catch((e) => {
        console.log(e)
        // this.$message({
        //   type: 'info',
        //   message: '取消输入'
        // })
        this.$confirm('是否继续绘制', '提示', {
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
          this.clearUploadArea()
        })
      })
    },
    uploadData() {
      this.polygonItems.forEach(item => {
        const path=[]
        const endPoint=[item.getPath()[0].lng,item.getPath()[0].lat]

        console.log(item.getPath())
        item.getPath().forEach(v => {

          path.push([v.lng, v.lat])
        });
        path.push(endPoint);
        this.area.geoJsonPolygon.coordinates.push(path);

      });
      console.log(this.area)

      //上传数据到后端的方法
      //使用axios或者其他方式发送请求到后端接口，这里假设后端接口为/drone/upload
      uploadArea(this.area).then((res) => {
        //处理响应结果
        if (res.code === 200) {
          //如果上传成功，提示用户并清空路径数组和线

          this.clearUploadArea()
        } else {
          //如果上传失败，提示用户错误信息
          this.$message({
            type: 'error',
            message: res.message
          })
        }
      })
    },
    /**
     * 清空上传禁飞区
     */
    clearUploadArea(){
      this.isRecording = 0
      if (this.mouseTool) {
        this.mouseTool.close();
      }
      this.map.clearMap();
      this.mouseTool=null;
      this.polyEditor=null;
      this.polyEditors=[];
      this.polygonItems=[];
      this.area.areaName=null;
      this.area.geoJsonPolygon.coordinates=[];
    },
    getAreaList(){
      areaList(this.queryParams).then(response => {
        console.log(response)
        this.areaList = response.items
        this.total = response.total
      })
      console.log(this.areaList)
    },
    deleteArea(row){
      const ids = row.id || this.ids
      this.$modal.confirm('确认删除路径名称为"' + row.areaName + '"的路径吗？').then(function() {
        return deleteArea(ids)
      }).then(() => {
        this.getAreaList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {
      })
    },
    /**
     * 去飞行
     * @constructor
     */
    JumpFlyList() {
      this.$router.push({ path: '/fly/flylist' })
    },
    /**
     * 查看禁飞区
     * @param row
     */
    getAreaDetails(row){
      if (this.isRecording === 1 || this.isRecording === 2) {
        this.$message({
          type: 'warning',
          message: '请结束你的绘制再查看！！！'
        })
        return
      }
      const ids = row.id
      areaQuery(ids).then((res => {
        if (res.code === 200) {
          this.isReView=true;
          let data = res.data
          // console.log(data)
          this.clearUploadArea()
          let points=[]
          data.geoJsonPolygon.coordinates[0].coordinates.forEach(item=>{
            points.push([item.x,item.y])
          });
          console.log(points)
          this.rePloygon= new AMap.Polygon({
            path: points,
            strokeColor: "#FF33FF",
            strokeWeight: 6,
            strokeOpacity: 0.2,
            fillOpacity: 0.4,
            fillColor: "#1791fc",
            zIndex: 50,
          })

          this.map.add( this.rePloygon);
          this.map.setFitView();
        }
      }))
    },
    removeReView(){
      this.isReView=false;
      this.rePloygon=null;
      const that = this
      this.rePloygons.forEach(item => {
        item.hide()
        that.map.remove(item)
        item = null
      })
      this.map.clearMap();

    },

    showAllArea(){
      if (this.isRecording === 1 || this.isRecording === 2) {
        this.$message({
          type: 'warning',
          message: '请结束你的绘制再查看！！！'
        })
        return
      }
      this.isReView=true;
      areaListAll().then(res => {
        console.log(res)
        this.clearUploadArea()
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
    margin-top: 60px;
    right: 0;
  }

  .edit {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 100px;
    right: 0;
  }

  .cancel {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 140px;
    right: 0;
  }

  .reBack {
    position: absolute;
    z-index: 999;
    margin: 20px;
    margin-top: 180px;
    right: 0;
  }

  .reference {
    position: absolute;
    z-index: 999;
    margin: 20px;
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

</style>
