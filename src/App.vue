<template>
  <div style="height: 95vh; width: 95vw;">
    <l-map
      v-model="zoom"
      v-model:zoom="zoom"
      :center="center"
      @move="log('move')"
    >
      <l-tile-layer
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
      ></l-tile-layer>

      <l-marker ref="location" :lat-lng="center">
        <!-- <l-icon :icon-url="icon.type.gold"/> -->
        <l-popup>
          你的位置
        </l-popup>
      </l-marker>

      <l-marker :lat-lng="item.geo" v-for="item in locations" :key="item.id">
        <l-popup>
          {{ item.name }}
          {{ item.address }}
        </l-popup>

      </l-marker>

    </l-map>
  </div>
</template>
<script>
import {
  LMap,
  LTileLayer,
  LMarker,
  // LControlLayers,
  LPopup,
  // LIcon,
  // LPolyline,
  // LPolygon,
  // LRectangle,
} from "@vue-leaflet/vue-leaflet";
import "leaflet/dist/leaflet.css";

export default {
  components: {
    LMap,
    LTileLayer,
    LMarker,
    // LControlLayers,
    LPopup,
    // LIcon,
    // LPolyline,
    // LPolygon,
    // LRectangle,
  },
  data() {
    return {
      locations: [
        {id: 1, name: "stanley咖啡", geo: [30.289065,120.034595], address: "浙江省杭州市余杭区五常街道西溪悦城26幢102室-1号"},
      ],
      zoom: 13,
      iconWidth: 25,
      iconHeight: 40,
      center: [30.283695, 120.000604],
      icon: {
        type: {
          gold: "https://cdn.rawgit.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png"
        }
      }
    };
  },
  computed: {
  },
  methods: {
    log(a) {
      console.log(a);
    },
  },
  mounted() {
    // this.$nextTick(() => {
    //   navigator.geolocation.getCurrentPosition(position => {
    //     const p = position.coords;
    //     this.center = [p.latitude, p.longitude];
    //   });
    // });
  },
};
</script>
