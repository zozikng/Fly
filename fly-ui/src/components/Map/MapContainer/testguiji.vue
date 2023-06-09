<template>
  <div class="page_demo">
    <div id="container" class='container' :style="node"> </div>
  </div>
</template>

<script>
export default {
  name:'testguiji',
  data () {
    return {
      screenHeight: document.documentElement.clientHeight,
      screenWidth: document.documentElement.clientWidth,
      node: {
        width: document.documentElement.clientWidth + 'px',
        height: document.documentElement.clientHeight + 'px'
      },
      marker: [],
      speed: 100
    }
  },
  mounted() {
    const that = this;
    // 初始化
    that.init();
    // 自适应
    window.onresize = () => {
      return (() => {
        window.screenHeight = document.documentElement.clientHeight;
        window.screenWidth = document.documentElement.clientWidth;
        that.node.height = window.screenHeight + 'px';
        that.node.width = window.screenWidth + 'px';
      })()
    };
  },
  created() {
  },
  computed: {
  },
  methods: {
    load2DMap() {
      // 运行轨迹经纬度坐标
      var linePath = [
        [116.405349,39.869372],
        [116.405762,39.869257],
        [116.406133,39.869162],
        [116.406449,39.869096],
        [116.40669,39.869063],
        [116.406862,39.869026],
        [116.406894,39.86917],
        [116.40691,39.869298],
        [116.406959,39.869442],
        [116.40698,39.869574],
        [116.40698,39.869611],
        [116.406986,39.869639],
        [116.406685,39.869569],
        [116.406508,39.869532],
        [116.406267,39.869491],
        [116.406036,39.86945],
        [116.405897,39.869388],
        [116.405596,39.869372],
      ];
      /**
       * 绘制路线
       */
        // console.log(linePath)
      var polyline = new AMap.Polyline({
          path: linePath,
          isOutline: true,
          outlineColor: 'rgba(0,0,0,0)',
          borderWeight: 3,
          strokeColor: "#1f9bb6",
          strokeOpacity: 1,
          strokeWeight: 4,
          // 折线样式还支持 'dashed'
          strokeStyle: "solid",
          // strokeStyle是dashed时有效
          lineJoin: 'round',
          lineCap: 'round',
          zIndex: 50,
        });
      console.log(polyline)
      // polyline.setMap(this.map);
      /**
       * 绘制移动轨迹路线
       */
      var passedPolyline = new AMap.Polyline({
        map: this.map,
        path: [],
        strokeColor: 'red',
        strokeWeight: 6,
      });
      /**
       * 创建一个icon
       */
      // var runIcon = new AMap.Icon({
      //      size: new AMap.Size(30, 40),
      //      image: '../../static/run.png',
      //      imageSize: new AMap.Size(30, 30),
      //      imageOffset: new AMap.Pixel(0, 10),
      //  });
      /**
       * 添加用于移动的图标
       */
      this.marker = new AMap.Marker({
        map: this.map,
        position: [116.405349,39.869372],
        // icon: runIcon,
        autoRotation: true
      });
      this.marker.setMap(this.map);
      this.marker.on('moving', function(e){
        passedPolyline.setPath(e.passedPath);
      });
      var _this = this;
      var polyline1 = new AMap.Polyline({
        path: linePath,
        isOutline: true,
        outlineColor: 'rgba(0,0,0,0)',
        borderWeight: 3,
        strokeColor: "red",
        strokeOpacity: 1,
        strokeWeight: 6,
        // 折线样式还支持 'dashed'
        strokeStyle: "solid",
        // strokeStyle是dashed时有效
        lineJoin: 'round',
        lineCap: 'round',
        zIndex: 51,
      });
      // 移动图标
      _this.marker.moveAlong(linePath,_this.speed);
    },
    /**
     * 初始化地图
     */
    init() {
      this.map = new AMap.Map('container', {
        zoom:18,//级别
        center: [116.405349,39.869372],//中心点坐标
        resizeEnable: true,
      });

      this.load2DMap()
    }
  }
}
</script>

<style>
.page_demo {
  padding: 0;
  margin: 0;
  width: 100%;
}
.container {
  height: 100px;
}
</style>
