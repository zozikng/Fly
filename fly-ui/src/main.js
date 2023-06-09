import Vue from 'vue'

import Cookies from 'js-cookie'

import Element from 'element-ui'
import './assets/styles/element-variables.scss'

import '@/assets/styles/index.scss' // global css
import '@/assets/styles/ruoyi.scss' // ruoyi css
import App from './App'
import store from './store'
import router from './router'
import directive from './directive' // directive
import plugins from './plugins' // plugins
import { download } from '@/utils/request'

import './assets/icons' // icon
import './permission' // permission control
import { getDicts } from "@/api/system/dict/data";
import { getConfigKey } from "@/api/system/config";
import { parseTime, resetForm, addDateRange, selectDictLabel, selectDictLabels, handleTree } from "@/utils/ruoyi";
// 分页组件
import Pagination from "@/components/Pagination";
// 自定义表格工具组件
import RightToolbar from "@/components/RightToolbar"
// 富文本组件
import Editor from "@/components/Editor"
// 文件上传组件
import FileUpload from "@/components/FileUpload"
// 图片上传组件
import ImageUpload from "@/components/ImageUpload"
// 图片预览组件
import ImagePreview from "@/components/ImagePreview"
// 字典标签组件
import DictTag from '@/components/DictTag'
// 头部标签组件
import VueMeta from 'vue-meta'
// 字典数据组件
import DictData from '@/components/DictData'
//使用高德地图
import AMap from 'vue-amap'
import AMapLoader from '@amap/amap-jsapi-loader';
import BaiduMap from 'vue-baidu-map';// 导入地图

// 全局方法挂载
Vue.prototype.getDicts = getDicts

Vue.prototype.getConfigKey = getConfigKey
Vue.prototype.parseTime = parseTime
Vue.prototype.resetForm = resetForm
Vue.prototype.addDateRange = addDateRange
Vue.prototype.selectDictLabel = selectDictLabel
Vue.prototype.selectDictLabels = selectDictLabels
Vue.prototype.download = download
Vue.prototype.handleTree = handleTree

// 全局组件挂载
Vue.component('DictTag', DictTag)
Vue.component('Pagination', Pagination)
Vue.component('RightToolbar', RightToolbar)
Vue.component('Editor', Editor)
Vue.component('FileUpload', FileUpload)
Vue.component('ImageUpload', ImageUpload)
Vue.component('ImagePreview', ImagePreview)

Vue.use(directive)
Vue.use(plugins)
Vue.use(VueMeta)
DictData.install()
Vue.use(AMap)
AMap.initAMapApiLoader({
  key: 'c589afd92be904044d680df23a7bc9a6',
  plugin: ['AMap.Autocomplete', 'AMap.PlaceSearch', 'AMap.Scale', 'AMap.OverView',
    'AMap.ToolBar', 'AMap.MapType', 'AMap.PolyEditor', 'AMap.CircleEditor', 'AMap.MarkerClusterer', 'AMap.MoveAnimation'],
  // 默认高德 sdk 版本为 1.4.4
  v: '1.4.15',
  uiVersion: '1.0.11'
})
// AMapLoader.load({
//   key: "c589afd92be904044d680df23a7bc9a6",              // 申请好的Web端开发者Key，首次调用 load 时必填
//   version: "2.0",   // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
//   plugins: ['AMap.PlaceSearch',
//     'AMap.Geocoder', 'AMap.Driving','AMap.Scale'
//   ], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
//   AMapUI: { //重点就是这个
//     version: '1.1',
//     plugins: ['misc/PathSimplifier', 'overlay/SimpleMarker'] //SimpleMarker设置自定义图标，PathSimplifier轨迹展示组件
//   }
//   // Loca: {
//   //     // 是否加载 Loca， 缺省不加载
//   //     version: '2.0.0' // Loca 版本，缺省 1.3.2
//   // }
// }).then((AMap) => {
//   // 挂载AMap
//   Vue.prototype.$AMap = AMap;
// });

// 进行全局注册，一次性引入百度地图组件库的所有组件
// ak为官方提供的密钥
Vue.use(BaiduMap, {
  ak: 'mOKasFZp7jhlELgkVcHbGyloMKCdRt6N'
})
/**
 * If you don't want to use mock-server
 * you want to use MockJs for mock api
 * you can execute: mockXHR()
 *
 * Currently MockJs will be used in the production environment,
 * please remove it before going online! ! !
 */

Vue.use(Element, {
  size: Cookies.get('size') || 'medium' // set element-ui default size
})

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
