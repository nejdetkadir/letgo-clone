<template>
  <splide :options="options" class="category-splide">
    <splide-slide v-for="(category, index) in categories" :key="index" class="pe-1 ps-1">
      <div class="card category-card" :style="{backgroundColor: category.color}" @click="linkTo(category.slug)">
        <div class="card-body text-white text-center">
          <i :class="handleIcon(category.icon)"></i>
        </div>
      </div>
      <p class="mt-2 text-center">{{category.name}}</p>
    </splide-slide>
  </splide>
</template>

<script>
import { Splide, SplideSlide } from '@splidejs/vue-splide';
import '@splidejs/splide/dist/css/themes/splide-default.min.css';
import {categories} from "../utils/routes";

export default {
  data() {
    return{
      categories: JSON.parse(this.categories_data),
      options: {
        type: 'loop',
        perPage: 6,
        perMove: 1,
        pagination: false,
        autoplay: true
      }
    }
  },
  props: ["categories_data"],
  components: {
    Splide,
    SplideSlide
  },
  methods: {
    handleIcon(icon) {
      return icon.substring(0, 3) + " fa" + icon.substring(3, icon.length)
    },
    linkTo(slug) {
      window.location.href = categories.view.show + slug;
    }
  }
}
</script>

<style>
  .category-card{
    border-radius: 20px;
    border: none;
    padding: 50px;
    cursor: pointer;
  }

  .category-card > .card-body > i{
    font-size: 36px;
  }

  .category-splide > .splide__arrows > .splide__arrow{
    top: 35%;
    background: white;
  }
</style>