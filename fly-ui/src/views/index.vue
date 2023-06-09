<template>
  <div class="app-container home">
    <el-row :gutter="15">
      <el-col :sm="24" :lg="24">
        <div class="footerImage" >
          <el-image :src="footerImageIndex" :fit="fit"></el-image>
          <el-image  :src="bgImageIndex" :fit="fit"></el-image>
        </div>
      </el-col>
    </el-row>
    <el-row :gutter="24">
      <el-col :sm="24" :lg="24">
<!--        <div class="bgImgae">-->

<!--        </div>-->
      </el-col>
<!--      <el-col :sm="24" :lg="24">-->
<!--        <div class="footerImgae" >-->
<!--          <el-image :src="footerImageIndex" :fit="fit"></el-image>-->
<!--        </div>-->
<!--      </el-col>-->
    </el-row>

<!--    <el-divider />-->
<!--    <el-row :gutter="20">-->
<!--      <el-col :xs="24" :sm="24" :md="12" :lg="8">-->

<!--      </el-col>-->
<!--      <el-col :xs="24" :sm="24" :md="12" :lg="8">-->
<!--        <el-card class="update-log">-->

<!--        </el-card>-->
<!--      </el-col>-->
<!--      <el-col :xs="24" :sm="24" :md="12" :lg="8">-->

<!--      </el-col>-->
<!--    </el-row>-->
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      bgImageIndex:require("@/assets/images/bgIndex.jpg"),
      footerImageIndex:require("@/assets/images/bgFooter.png"),
      fit:"fill",
      // 版本号
      version: "3.8.5"
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  .bgImgae{

    //max-height: 515px;
  }
  .footerImage{
    width: 100%;
    text-align:center;
    background: RGB(2,81,202);
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

}
</style>

