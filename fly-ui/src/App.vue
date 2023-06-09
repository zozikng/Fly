<template>
  <div id="app">
    <router-view />
    <theme-picker />
  </div>
</template>

<script>
import ThemePicker from "@/components/ThemePicker";

export default {
  name: "App",
  components: { ThemePicker },
    metaInfo() {
        return {
            title: this.$store.state.settings.dynamicTitle && this.$store.state.settings.title,
            titleTemplate: title => {
                return title ? `${title} - ${process.env.VUE_APP_TITLE}` : process.env.VUE_APP_TITLE
            }
        }
    }
};
</script>
<style lang="less">
#app .theme-picker {
  display: none;
}
// Message Box 适配移动端，宽度小于720px时宽度使用下面这个
@media only screen and (max-width: 720px) {
  .el-message-box {
    width: 320px !important;
  }
}
@media screen and (min-width: 220px) and (max-width:600px) {
  .el-dialog{
    width: 90% !important;
  }
}

</style>
