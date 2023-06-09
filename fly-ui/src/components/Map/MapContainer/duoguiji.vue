<template>
  <div class="map">
    <!-- popover 弹出框 -->
    <el-popover placement="bottom" width="550" trigger="click">
      <el-button
        style="margin-bottom: 20px"
        type="primary"
        @click="queryHisData"
      >查询</el-button
      >
      <div style="display: inline-block" v-if="tableData.length">
        <el-button
          style="margin-left: 10px"
          v-show="getNaviStatus == 'stop' || navgtrEnd"
          type="primary"
          icon="el-icon-video-play"
          @click="startNavgtr"
        >开始巡航</el-button
        >
        <el-button
          v-show="getNaviStatus == 'moving'"
          type="primary"
          icon="el-icon-video-pause"
          @click="pauseNavgtr"
        >暂停巡航</el-button
        >
        <el-button
          v-show="getNaviStatus == 'pause' && !navgtrEnd"
          type="primary"
          icon="el-icon-video-play"
          @click="resumeNavgtr"
        >继续巡航</el-button
        >
      </div>
      <el-table
        :data="tableData"
        border
        height="350"
        :header-cell-style="{ 'text-align': 'center' }"
        :cell-style="{ 'text-align': 'center' }"
      >
        <el-table-column
          prop="line_name"
          label="线路名称"
        >
        </el-table-column>
        <el-table-column
          prop="equip_name"
          label="设备名称">
        </el-table-column>
        <el-table-column
          prop="point"
          :show-overflow-tooltip="true"
          label="坐标">
        </el-table-column>
        <el-table-column prop="data_value" label="浓度">
          <template v-slot="scope">
            <el-tag size="medium">{{ scope.row.data_value }} {{ scope.row.data_unit }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态">
          <template v-slot="scope">
            <el-tag v-if="scope.row.status === 0" type="warning">
              <i class="el-icon-warning"> 异常</i>
            </el-tag>
            <el-tag v-else type="success">
              <i class="el-icon-success"> 正常</i>
            </el-tag>
          </template>
        </el-table-column>
      </el-table>

      <el-button
        class="reference"
        slot="reference"
        type="primary"
        icon="el-icon-map-location"
      >巡航历史</el-button>
    </el-popover>
    <!-- 地图容器 -->
    <div id="container"></div>
  </div>
</template>

<script>
import AMapLoader from "@amap/amap-jsapi-loader";
export default {
  name: "duoguiji",
  data() {
    return {
      tableData: [], // 表格数据
      map: null, // 地图实例
      pathSimplifierIns: null, // 巡航路线实例
      navgtr: null, // 巡航器实例
      navgtrEnd: false, // 本轮巡航结束 结束为 true
      infoWindow: null, // 信息窗体实例
      // 巡航器、线路默认样式配置
      defaultRenderOpts: {
        renderAllPointsIfNumberBelow: 1,
        pathTolerance: 0,
        keyPointTolerance: 1, // 绘制中间节点的简化参数，小于0, 不绘制任何中间节点；默认设置。大于等于0，对简化过的绘制轨迹线做二次简化
        pathNavigatorStyle: {
          pathLinePassedStyle: {
            lineWidth: 5, // 巡航器经过路线宽度
            strokeStyle: "#66AA00",
            borderWidth: 1,
            borderStyle: "#eeeeee",
            dirArrowStyle: true,
          },
        },
        pathLineStyle: {
          lineWidth: 10, // 轨迹宽度
          strokeStyle: "#FA8C16",
          dirArrowStyle: true,
        },
        keyPointStyle: {
          radius: 7, // 路径点大小
          fillStyle: "#576d93",
          lineWidth: 1,
          strokeStyle: "#eeeeee",
        },
      },
      // json
      res: {
        dataList: [
          {
            line_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            equip_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            line_name: "线路A",
            equip_name: "设备A",
            alarm_max: "10",
            equip_model_name: "LH007-TDL80",
            point: "117.221354,31.849226",
            data_name: "CH4",
            data_value: "7.15",
            data_unit: "%",
            status: 1,
          },
          {
            line_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            equip_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            line_name: "线路A",
            equip_name: "设备A",
            alarm_max: "10",
            equip_model_name: "LH007-TDL80",
            point: "117.221432,31.847613",
            data_name: "CH4",
            data_value: "5.73",
            data_unit: "%",
            status: 1,
          },
          {
            line_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            equip_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            line_name: "线路A",
            equip_name: "设备A",
            alarm_max: "10",
            equip_model_name: "LH007-TDL80",
            point: "117.221625,31.845863",
            data_name: "CH4",
            data_value: "12.43",
            data_unit: "%",
            status: 0,
          },
          {
            line_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            equip_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            line_name: "线路A",
            equip_name: "设备A",
            alarm_max: "10",
            equip_model_name: "LH007-TDL80",
            point: "117.224822,31.845096",
            data_name: "CH4",
            data_value: "4.58",
            data_unit: "%",
            status: 1,
          },
          {
            line_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            equip_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            line_name: "线路A",
            equip_name: "设备A",
            alarm_max: "10",
            equip_model_name: "LH007-TDL80",
            point: "117.225358,31.843085",
            data_name: "CH4",
            data_value: "7.25",
            data_unit: "%",
            status: 1,
          },
          {
            line_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            equip_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            line_name: "线路A",
            equip_name: "设备A",
            alarm_max: "10",
            equip_model_name: "LH007-TDL80",
            point: "117.225337,31.840885",
            data_name: "CH4",
            data_value: "25.23",
            data_unit: "%",
            status: 0,
          },
          {
            line_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            equip_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            line_name: "线路A",
            equip_name: "设备A",
            alarm_max: "10",
            equip_model_name: "LH007-TDL80",
            point: "117.221517,31.840794",
            data_name: "CH4",
            data_value: "9.03",
            data_unit: "%",
            status: 1,
          },
          {
            line_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            equip_id: "ddcbe9b9857d4dcfb6ef9219a865ccc01",
            line_name: "线路A",
            equip_name: "设备A",
            alarm_max: "10",
            equip_model_name: "LH007-TDL80",
            point: "117.218685,31.839864",
            data_name: "CH4",
            data_value: "4.25",
            data_unit: "%",
            status: 1,
          },
        ],
      },
    };
  },

  computed: {
    getNaviStatus() {
      if (this.navgtr) {
        return this.navgtr.getNaviStatus();
      }
    },
  },

  props: {
    drone:null,
  },

  created() {
    this.initAMap()
  },

  mounted() {

  },

  methods: {
    queryHisData() {
      this.tableData = this.res.dataList;
      this.drawNavgtrPath(this.tableData);
    },

    startNavgtr() {
      this.navgtr.start(); // 开始
      this.navgtrEnd = false;
    },

    pauseNavgtr() {
      this.navgtr.pause(); // 暂停
    },

    resumeNavgtr() {
      this.navgtr.resume(); // 继续
    },

    initAMap() {
      window._AMapSecurityConfig = {
        securityJsCode: "205f1f075adc22848bd1f36a36f215c0",
      }; //加密，根据高德key要求加上
      AMapLoader.load({
        key: "c589afd92be904044d680df23a7bc9a6",
        version: "2.0",
        plugins: ['AMap.InfoWindow', 'AMap.Polyline', 'AMap.CircleMarker'], // 需要使用的的插件列表
        AMapUI: {
          // 是否加载 AMapUI，缺省不加载
          version: "1.1",
          plugins: [], // 需要加载的 AMapUI ui插件
        }
      }).then((AMap) =>  {
        this.map = new AMap.Map("container", {
          center: [111.67, 29.05],
          resizeEnable: true,
          zoom: 16,
        });
      })
    },

    drawNavgtrPath(dataList) {
      const that = this;
      AMapUI.load(["ui/misc/PathSimplifier"], (PathSimplifier) => {
        if (!that.pathSimplifierIns) {
          that.pathSimplifierIns = new PathSimplifier({
            zIndex: 100,
            map: that.map, // 所属的地图实例
            getPath: (pathData, pathIndex) => {
              const lnglatList = [];
              for (const item of pathData) {
                lnglatList.push(item.point.split(","));
              }
              // 返回轨迹数据中的节点坐标信息
              return lnglatList;
            },
            getHoverTitle: (pathData, pathIndex, pointIndex) => {
              if (pointIndex >= 0) {
                // point
                return `
                  ${pathData[pointIndex].line_name}-${pointIndex + 1}测量点：
                  ${pathData[pointIndex].data_value}${
                  pathData[pointIndex].data_unit
                }
                `;
              }
              // path
              return `该线路共${pathData.length}个测量点`;
            },
            autoSetFitView: false,
            renderOptions: that.defaultRenderOpts, // 巡航器、线路默认样式配置
          });
          // 创建信息窗体
          that.infoWindow = new AMap.InfoWindow({
            offset: new AMap.Pixel(1, -30),
          });
        }

        // 设置数据
        that.pathSimplifierIns.setData([dataList]);

        // 对第一条线路（即索引 0）创建一个巡航器
        that.navgtr = that.pathSimplifierIns.createPathNavigator(0, {
          loop: false, // 循环播放
          speed: 500, // 巡航速度，单位千米/小时
          pathNavigatorStyle: {
            width: 45,
            height: 45,
            content: PathSimplifier.Render.Canvas.getImageContent(require("@/assets/drone/drone.png")), // 自定义巡航器样式
            strokeStyle: null,
            fillStyle: null,
          },
        });

        // 打开信息窗体
        that.infoWindow.open(that.map, that.navgtr.getPosition());
        // 设置信息窗体内容
        that.infoWindow.setContent(
          `浓度：${dataList[0].data_value}${dataList[0].data_unit}`
        );
        // 监听巡航器
        that.navgtr.on("move", function () {
          // 此处不能用箭头函数否则会改变this指向
          that.infoWindow.open(that.map, that.navgtr.getPosition());
          let idx = this.getCursor().idx; // 走到了第几个点
          let point = dataList[idx];
          point &&
          point.data_value &&
          that.infoWindow.setContent(
            `浓度：${point.data_value}${point.data_unit}`
          );
          // 通过 监听判断巡航器是否走到最后一个点来确定本轮结束
          if (idx + 1 === dataList.length) {
            that.navgtrEnd = true;
          }
        });
      });
    },
  },
};
</script>

<style lang="less" scoped>
.map {
  padding: 15px 10px;
  background: #fff;
  .reference {
    position: absolute;
    z-index: 999;
    margin: 10px 20px 0 0;
    right: 0;
  }
}

#container {
  width: 100%;
  height: 600px;
}
///deep/.amap-marker-label,
///deep/.amap-info-content {
//  color: #62718a;
//  font-size: 14px;
//  padding: 0.75rem;
//  border-radius: 0.25rem;
//  background-color: #fff;
//  border-width: 0;
//  box-shadow: 0 2px 6px 0 rgba(114, 124, 245, 0.5);
//}
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

