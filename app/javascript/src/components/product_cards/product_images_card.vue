<script>
import {Splide, SplideSlide} from "@splidejs/vue-splide";

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
  }
}
</script>

<template>
  <div class="card product-images-card">
    <splide :options="options">
      <splide-slide v-for="(image, index) in images" :key="index">
        <img :src="image.cover.url" :alt="product_name" class="card-img-top">
      </splide-slide>
    </splide>
  </div>
</template>

<style>
  .product-images-card{
    cursor: pointer;
  }
</style>
