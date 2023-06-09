<template>
  <div>
    <baidu-map class="bm-view"
               ak="mOKasFZp7jhlELgkVcHbGyloMKCdRt6N"
               :center="center"
               :zoom="zoom"
               @ready="handler"
               :scroll-wheel-zoom="true">
      <!-- 滚动缩放-->
      <bml-marker-clusterer></bml-marker-clusterer>
      <!-- 比例尺寸-->
      <bm-scale anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-scale>
      <!-- 地图缩放-->
      <bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-navigation>
      <!-- 城市-->
<!--      <bm-city-list anchor="BMAP_ANCHOR_TOP_LEFT"></bm-city-list>-->
      <!-- 地图类型-->
      <bm-map-type :map-types="['BMAP_NORMAL_MAP', 'BMAP_HYBRID_MAP']" anchor="BMAP_ANCHOR_TOP_LEFT"></bm-map-type>
      <!-- 缩略图-->
      <bm-overview-map anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :isOpen="true"></bm-overview-map>
      <!-- 定位-->
      <bm-geolocation anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :showAddressBar="true" :autoLocation="true"></bm-geolocation>

    </baidu-map>
  </div>
</template>

<script>
import BaiduMap from 'vue-baidu-map/components/map/Map.vue'
import {BmlMarkerClusterer,BmScale,BmNavigation,BmMapType, BmOverviewMap, BmGeolocation,BmCityList} from 'vue-baidu-map/components'


export default {
  name: 'index2',
  components: {
    BaiduMap,
    BmlMarkerClusterer,
    BmScale,
    BmNavigation,
    BmMapType,
    BmOverviewMap,
    BmGeolocation,
    BmCityList
  },
  data () {
    return {
      center: {lng: 0, lat: 0},
      zoom: 3,
      map: null,
      polyline: null,
      points: [
        // new BMap.Point(116.328841,39.934148),
        // new BMap.Point(116.330818,39.935402),
        // new BMap.Point(116.330452,39.936228),
        // new BMap.Point(116.329337,39.937332),
        // new BMap.Point(116.32901,39.938042),
        // new BMap.Point(116.329075,39.939232),
        // new BMap.Point(116.329732,39.940386),
        // new BMap.Point(116.331708,39.941373),
        // new BMap.Point(116.332203,39.94237),
        // new BMap.Point(116.331836,39.943358),
        // new BMap.Point(116.330454,39.944518),
        // new BMap.Point(116.329422,39.94584),
        // new BMap.Point(116.328735,39.947172),
        // new BMap.Point(116.328666,39.947695),
        // new BMap.Point(116.328923,39.948143),
        // new BMap.Point(116.329954,39.949003),
        // new BMap.Point(116.332185,39.949963),
        // new BMap.Point(116.333752,39.95069),
        // new BMap.Point(116.335156,39.951787),
        // new BMap.Point(116.336559,39.952935),
        // new BMap.Point(116.337905,39.954012),
        // new BMap.Point(116.33913,39.9553),
        // new BMap.Point(116.341083,39.955998),
        // new BMap.Point(116.342805,39.956637),
        // new BMap.Point(116.344405,39.957467),
        // new BMap.Point(116.344999,39.958047),
        // new BMap.Point(116.345601,39.958618),
        // new BMap.Point(116.347144,39.95914),
        // new BMap.Point(116.348829,39.959662),
        // new BMap.Point(116.349994,39.960062),
        // new BMap.Point(116.351609,39.960748),
        // new BMap.Point(116.352799,39.961425),
        // new BMap.Point(116.353394,39.962208),
        // new BMap.Point(116.353915,39.963004),
        // new BMap.Point(116.354641,39.964352),
        // new BMap.Point(116.355693,39.965698),
        // new BMap.Point(116.357081,39.96688),
        // new BMap.Point(116.358404,39.968063),
        // new BMap.Point(116.359999,39.969115)
      ],
      currentIndex: 0,
      marker: null,
      timer: null,
      walkSpeed: 100, // 步行速度，单位：米/秒
    }
  },
  methods: {
    handler ({BMap, map}) {
      console.log(BMap, map)
      this.center.lng = 116.404
      this.center.lat = 39.915
      this.zoom = 15
      // map.addEventListener('click', e => {
      //   const point = new BMap.Point(e.point.lng, e.point.lat)
      //   this.points.push(point)
      //   if (this.points.length > 1) {
      //     // 绘制线段
      //     if (!this.polyline) {
      //       this.polyline = new BMap.Polyline(this.points, { strokeColor: 'blue', strokeWeight: 6, strokeOpacity: 0.5 })
      //       map.addOverlay(this.polyline)
      //     } else {
      //       this.polyline.setPath(this.points)
      //     }
      //   }
      //   console.log(this.points)
      // })



    },


  }

}
</script>

<style scoped>
.bm-view {
  width: 100%;
  height: 650px;
}
</style>
