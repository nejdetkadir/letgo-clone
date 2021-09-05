<script>
import {Splide, SplideSlide} from "@splidejs/vue-splide";
import "lightgallery.js";
import "lightgallery.js/dist/css/lightgallery.css";

export default {
  data() {
    return{
      images: JSON.parse(this.images_data),
      options: {
        type: 'loop',
        perPage: 1,
        perMove: 1,
        pagination: true,
        autoplay: false
      }
    }
  },
  props: ["images_data", "product_name"],
  components: {
    Splide,
    SplideSlide
  },
  mounted() {
    window.lightGallery(document.getElementById("lightgallery"));
  },
  methods: {
    onClickImage(index) {
      document.getElementById("lightgallery").querySelector(`a[data-index="${index}"]`).click();
    }
  }
}
</script>

<template>
  <div class="card product-images-card">
    <splide :options="options">
      <splide-slide v-for="(image, index) in images" :key="index">
        <img :src="image.cover.url" :alt="product_name" class="card-img-top" @click="onClickImage(index)">
      </splide-slide>
    </splide>
    <div class="d-none" id="lightgallery">
      <a v-for="(image, index) in images" :key="index" :href="image.url" :data-index="index"></a>
    </div>
  </div>
</template>

<style>
  .product-images-card{
    cursor: pointer;
  }
</style>
