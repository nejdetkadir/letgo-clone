<script>
import fileInput from "./file_input.vue";
import {mapMutations, mapState} from "vuex";

export default {
  data() {
    return{
      mouseOver: false
    }
  },
  components: {
    fileInput
  },
  computed: {
    ...mapState("product", ["form"]),
  },
  methods: {
    ...mapMutations("product", ["setCategoryId"]),
    handleIcon(icon) {
      return icon.substring(0, 3) + " fa" + icon.substring(3, icon.length);
    },
    onSelectCategory(index, id) {
      if (this.form.categoryIndex != index) {
        this.setCategoryId({id, index});
      }
    }
  },
  props: {
    categories: {
      type: Array,
      required: true
    }
  }
}
</script>

<template>
  <div>
    <p class="text-secondary">Bir kategori seç</p>
    <div class="d-flex flex-wrap">
      <div class="col-4" v-for="(category, index) in categories" :key="index">
        <div class="card off-product-card" :class="{'is-selected' : index == form.categoryIndex, 'border-top-0 border-bottom-0' : (index == 3 || index == 4 || index == 5), 'border-end-0': (index == 0 || index == 1 || index == 3 || index == 4 || index == 6 || index == 7) }" @click="onSelectCategory(index, category.id)">
          <div class="card-body text-center">
            <i class="off-product-icon text-white" :class="handleIcon(category.icon)" :style="{backgroundColor: category.color}"></i>
            <p class="mb-0 mt-1">{{category.name.toUpperCase()}}</p>
          </div>
        </div>
      </div>
    </div>

    <div v-if="form.categoryId > -1">
      <p class="text-secondary mt-3">Fotoğraflar</p>
      <div class="card off-product-image-card" @mouseover="mouseOver=true" @mouseout="mouseOver=false" @click="$refs.fileInputComponent.$el.click()">
        <div class="card-body text-center">
          <div class="d-block">
            <i class="fas fa-image fs-2 off-product-image-icon"></i>
            <p class="mb-0 mt-1 fs-4 fw-bold" :style="{color : mouseOver ? '#ff3f55' : '#7a7a7a'}">Gözat</p>
            <p class="p-3">İlanına 6 adete kadar fotoğraf yükleyebilirsin.</p>
            <file-input ref="fileInputComponent"/>
          </div>
        </div>
      </div>
    </div>
  </div> 
</template>

<style>
  .off-product-icon{
    font-size: 25px;
    padding: 1rem;
    border-radius: 50%;
  }

  .off-product-card{
    cursor: pointer;
    height: 120px;
    border-radius: 0;
  }

  .off-product-card > .card-body > p{
    font-size: 10px;
  }

  .is-selected{
    background-color: #f5f5f5;
  }

  .off-product-image-card{
    cursor: pointer;
    border: 3px solid #eeeeee;
  }

  .off-product-image-card:hover{
    border-color: #fecbd3;
  }

  .off-product-image-icon{
    color: #eeeeee;
  }
</style>