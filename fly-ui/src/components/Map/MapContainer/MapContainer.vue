<template>
  <div id="container"></div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader';
import bus from '@/components/Map/eventBus/eventBus.js';

export default {
  name: 'MapContainer',
  data(){
    return{
      //此处不声明 map 对象，可以直接使用 this.map赋值或者采用非响应式的普通对象来存储。
      map:null,
      autoOptions: {
        input: ''
      },
      auto: null,
      placeSearch:null,
      searchPlaceInput:'',

    }
  },
  watch: {
    searchPlaceInput(newValue) {
      if (newValue != null) {
        this.placeSearch.search(newValue)
      }
    }
  },
  methods:{
    initMap(){
      AMapLoader.load({
        key:"c589afd92be904044d680df23a7bc9a6",             // 申请好的Web端开发者Key，首次调用 load 时必填
        version:"2.0",      // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
        plugins:['AMap.ToolBar', 'AMap.Scale', 'AMap.HawkEye', 'AMap.MapType', 'AMap.Geolocation','AMap.PlaceSearch','AMap.AutoComplete'],       // 需要使用的的插件列表，如比例尺'AMap.Scale'等
      }).then((AMap)=>{
        this.map = new AMap.Map("container",{  //设置地图容器id
          viewMode:"3D",    //是否为3D地图模式
          zoom:5,           //初始化地图级别
          center:[105.602725,37.076636], //初始化地图中心点位置
        });
        this.map.addControl(new AMap.Scale())
        this.map.addControl(new AMap.ToolBar())
        this.map.addControl(new AMap.HawkEye())
        this.map.addControl(new AMap.MapType())
        this.map.addControl(new AMap.Geolocation())
        this.auto = new AMap.AutoComplete(this.autoOptions)
        this.placeSearch = new AMap.PlaceSearch({
          map: this.map
        }) //构造地点查询类
        this.auto.on('select', this.select)

      }).catch(e=>{
        console.log(e);
      })
    },
    select(e) {

      this.placeSearch.setCity(e.poi.adcode)
      this.placeSearch.search(e.poi.name) //关键字查询查询
    }
  },
  mounted(){
    window._AMapSecurityConfig = {
      securityJsCode: "205f1f075adc22848bd1f36a36f215c0",
    }; //加密，根据高德key要求加上
    //DOM初始化完成进行地图初始化
    this.initMap();
  },
  created() {
    bus.$on('share_id', val => {
      this.autoOptions.input = val
    })
    bus.$on('share', val => {
      this.searchPlaceInput = val
    })
  },
}
</script>

<style scoped>
#container {
  padding: 0px;
  margin: 0px;
  width: 100%;
  height: 600px;
}
</style>
