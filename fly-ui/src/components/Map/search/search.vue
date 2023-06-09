<template>
  <div class="search">

    <el-row type="flex" justify="start" align="top" gutter="20"  >
      <el-col :span="5">
        <el-input placeholder="请输入要搜索的地方" size="mini" v-model="input" :id="search_id"
                  prefix-icon="el-icon-search"
        ></el-input>
      </el-col>
      <el-col :span="4">
        <el-button type="primary" size="mini" icon="el-icon-search" @click="sendMsg">搜索</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import bus from '@/components/Map/eventBus/eventBus.js'

export default {
  name: 'search',
  data() {
    return {
      search_id: 'searchId',
      input: ''
    }
  },

  methods: {
    sendMsg() {
      bus.$emit('share', this.input)
    },
    sendId() {
      bus.$emit('share_id', this.search_id)
    }
  },
  mounted() {
    this.sendId()
  }
}
</script>

<style scoped>
.search {
  margin: 10px 8px 8px 8px;
}
</style>



