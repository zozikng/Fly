<template>
  <div class="main">
<!--    //容器的宽高不能少-->
<!--    <section class="section">-->
<!--      //这里地图,style="width:100%;height:100%"这个不能少-->
      <div id="container" style="width:100%;height:100%" />
<!--      //这里是控制轨迹的按钮组-->
      <div class="ebox">
        <el-button-group>
          <input type="button" class="btn" value="开始动画" id="start" @click="startAnimation()" />
          <input type="button" class="btn" value="暂停动画" id="pause" @click="pauseAnimation()" />
          <input type="button" class="btn" value="继续动画" id="resume" @click="resumeAnimation()" />
          <input type="button" class="btn" value="停止动画" id="stop" @click="stopAnimation()" />
          <el-button type="primary" icon="el-icon-search" @click="startAnimation()">轨迹回放</el-button>
          <el-button type="danger" icon="el-icon-delete" @click='clearVehicleTrajectory'>轨迹清除</el-button>
        </el-button-group>
      </div>
<!--    </section>-->
  </div>
</template>

<script>
export default {
  name: 'dashboard',
  data() {
    return {
      firstArr: [116.478935, 39.997761], //中心点/初始坐标=>联调时，用后台数据将此数据覆盖

      //绘制线路需要的坐标=>联调时，用后台数据将此数据覆盖(经纬度不要写反了,反了是出不来的)
      lineArr: [
        [116.478935, 39.997761],
        [116.478939, 39.997825],
        [116.478912, 39.998549],
        [116.478912, 39.998549],
        [116.478998, 39.998555],
        [116.478998, 39.998555],
        [116.479282, 39.99856],
        [116.479658, 39.998528],
        [116.480151, 39.998453],
        [116.480784, 39.998302],
        [116.480784, 39.998302],
        [116.481149, 39.998184],
        [116.481573, 39.997997],
        [116.481863, 39.997846],
        [116.482072, 39.997718],
        [116.482362, 39.997718],
        [116.483633, 39.998935],
        [116.48367, 39.998968],
        [108.983569, 34.285675],
        [106.205794, 38.458831],
        [111.761777, 40.875595],
        [103.85094, 35.987496]
      ],
      map: null,
      marker: null,
      //moveSpeed:1000000,//需求要求改变速度的可保留
    }
  },
  mounted() { //异步加载（否则报错initMap is not defined）
    setTimeout(() => {
      this.initMap() // 初始化地图
      this.initroad()// 初始化轨迹
    }, 1000)
  },
  beforeDestroy() {//离开页面，销毁掉
    this.map && this.map.destroy();
  },
  methods: {
    // 初始化地图
    initMap() {
      this.map = new AMap.Map('container', {
        resizeEnable: true, // 窗口大小调整
        center: this.firstArr, // 中心 firstArr: [116.478935, 39.997761],
        zoom: 15
      })
      // 添加工具栏
      this.map.plugin(['AMap.ToolBar', 'AMap.Scale'], () => {
        // const toolbar = new AMap.ToolBar()// 工具条
        const scale = new AMap.Scale() // 比例尺
        // this.map.addControl(toolbar)
        this.map.addControl(scale)
      })
      AMap.plugin('AMap.MoveAnimation', function(){});
      // 添加maker
      this.marker = new AMap.Marker({
        map: this.map,
        position: this.firstArr,
        // icon: 'https://webapi.amap.com/images/car.png',
        icon: 'https://webapi.amap.com/images/car.png',
        offset: new AMap.Pixel(-26, -13), // 调整图片偏移
        autoRotation: true, // 自动旋转
        // angle: -90 // 图片旋转角度
      });
      this.initroad();
    },
    // 初始化轨迹
    initroad() {
      // 将 icon 传入 marker(起始标记)
      var startMarker = new AMap.Marker({
        position: this.lineArr[0],
        icon: 'https://webapi.amap.com/theme/v1.3/markers/n/start.png',
        offset: new AMap.Pixel(-13, -30)
      });
      // 创建一个 icon
      // var endIcon = new AMap.Icon({
      //   size: new AMap.Size(25, 34),
      //   // image: 'https://webapi.amap.com/images/car.png',
      //   // imageSize: new AMap.Size(135, 40),
      //   imageOffset: new AMap.Pixel(-95, -3)
      // });



      // 将 icon 传入 marker
      var endMarker = new AMap.Marker({
        // position: new AMap.LngLat(116.45, 39.93),
        position: this.lineArr[this.lineArr.length - 1],
        icon: 'https://webapi.amap.com/theme/v1.3/markers/n/end.png',
        offset: new AMap.Pixel(-13, -30)
      });
      // 将 markers 添加到地图
      this.map.add([startMarker, endMarker]);


      // 绘制还未经过的路线
      this.polyline = new AMap.Polyline({
        map: this.map,
        path: this.lineArr,
        showDir: true,
        strokeColor: 'red', // 线颜色--蓝色
        // strokeOpacity: 1,     //线透明度
        strokeWeight: 6, // 线宽
        strokeStyle: "solid"  ,//线样式
        // lineJoin: 'round' // 折线拐点的绘制样式
      })


      // 绘制路过了的轨迹
      var passedPolyline = new AMap.Polyline({
        map: this.map,
        strokeColor: 'green', // 线颜色-绿色
        path: [],
        showDir: true,
        // strokeOpacity: 1,     //线透明度
        strokeWeight: 6 ,// 线宽
        strokeStyle: "solid"  //线样式
      })

      this.marker.on('moving', e => {
        passedPolyline.setPath(e.passedPath)
      });
      this.map.setFitView(startMarker,endMarker,this.lineArr) // 合适的视口
    },
    startAnimation() {//车辆轨迹回放开始
      this.marker.moveAlong(this.lineArr, 1000000); //这里的1000000为速度，可根据绘制线路需要的坐标来调整
      this.marker.moveTo()
      //（调试时不要设置太小了，不然看不出来）
      // this.marker.moveAlong(this.lineArr, this.moveSpeed);
    },
    pauseAnimation() {//车辆轨迹回放暂停
      this.marker.pauseMove();
    },
    resumeAnimation() {//车辆轨迹回放继续
      this.marker.resumeMove();
    },
    stopAnimation() {//车辆轨迹回放停止
      this.marker.stopMove();
    },
    carFastMove() {//车辆轨迹回放改变速度
      this.moveSpeed = this.moveSpeed * 200;
    },
    // 表格选中单行
    handleTableRow(row, event, column) {
      const This = this
      This.firstArr = []
      This.firstArr.push(row.longitude)
      This.firstArr.push(row.latitude)
      This.initMap()//初始化地图

      //获取后台路线数据
      //This.formData.deviceNumber = row.deviceNumber
      //This.getVehicleCarGpsData()//渲染轨迹
    },
    // 轨迹清除
    clearVehicleTrajectory() {
      const This = this
      This.initMap()//初始化地图
      // This.getVehicleCarGpsData()//后台数据渲染轨迹
    },
  }
}
</script>
<style scoped>
.main {
  position: relative;
  width: 100%;
  height: 750px;
}
#container {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}
.ebox {
  position: absolute;
  top: 20px;
  left: 20px;
  z-index: 100;
}
</style>
