<template>
  <div>
    <!--    <search ></search>-->
    <!--    <map-container>-->

    <!--    </map-container>-->
<!--    <dashboard></dashboard>-->
<!--  <guiji></guiji>-->
<!--    <testguiji></testguiji>-->
    <duoguiji :drone="drone" ></duoguiji>

  </div>
</template>

<script>
import MapContainer from '@/components/Map/MapContainer/MapContainer.vue'
import Search from '@/components/Map/search/search.vue'
import dashboard from '@/components/Map/MapContainer/dashboard.vue'
import guiji from '@/components/Map/MapContainer/guiji.vue'
import testguiji from '@/components/Map/MapContainer/testguiji.vue'
import duoguiji from '@/components/Map/MapContainer/duoguiji.vue'
import Duoguiji from '@/components/Map/MapContainer/duoguiji.vue'


export default {
  name: 'testMap',
  components: { Duoguiji,   Search, MapContainer, dashboard ,guiji,testguiji},
  data(){
    return{
      drone: null,
    }
  },
  created(){

  },
  mounted() {
    console.log(this.$route.query.row)
    this.drone = this.$route.query.row
  },
  methods:{
  }
}
</script>

<style scoped>

</style>
