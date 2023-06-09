<template>
  <div class="map-container">
    <div id="map" class="map"></div>
    <div class="controls">
      <button @click="play">开始</button>
      <button @click="resume">继续</button>
      <button @click="pause">停止</button>
      <button @click="clear">清除</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'guiji',
  data() {
    return {
      map: null,
      driving: null,
      paths: [
        [
          [116.43244, 39.92937],
          [116.43241, 39.92932],
          [116.43236, 39.92928],
          [116.43228, 39.92926],
          [116.43222, 39.92925]
        ],
        [
          [116.43222, 39.92925],
          [116.43213, 39.92926],
          [116.43206, 39.92927],
          [116.43199, 39.9293],
          [116.43194, 39.92933]
        ]
      ],
      timer: null,
      currentIndex: 0
    };
  },
  mounted() {
    this.initMap();
  },
  methods: {
    initMap() {
      this.map = new AMap.Map('map', {
        center: [116.397428, 39.90923],
        zoom: 14
      });
    },
    play() {
      if (this.driving) {
        this.driving.clear();
      }
      this.driving = new AMap.Driving({
        map: this.map,
        hideMarkers: true
      });
      this.timer = setInterval(() => {
        if (this.currentIndex < this.paths.length) {
          this.driving.search(this.paths[this.currentIndex], () => {
            if (this.currentIndex === this.paths.length - 1) {
              clearInterval(this.timer);
            }
          });
          this.currentIndex++;
        } else {
          clearInterval(this.timer);
        }
      }, 3000);
    },
    pause() {
      clearInterval(this.timer);
    },
    resume() {
      if (this.currentIndex < this.paths.length) {
        this.play();
      }
    },
    clear() {
      clearInterval(this.timer);
      this.driving.clear();
      this.currentIndex = 0;
    }
  }
}
</script>

<style scoped>
.map-container {
  position: relative;
  width: 100%;
  height: 500px;
}

.map {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}

.controls {
  position: absolute;
  top: 20px;
  left: 20px;
  z-index: 100;
}

button {
  margin-right: 10px;
}
</style>
