<script>
import categoryStep from "./product_sidebar/category_step.vue";
import productDetailStep from "./product_sidebar/product_detail_step.vue";
import {mapState} from "vuex";

export default {
  data() {
    return{
      categories: JSON.parse(this.categories_data)
    }
  },
  computed: {
    ...mapState("product", ["form"])
  },
  props: ["categories_data"],
  components: {
    categoryStep,
    productDetailStep
  }
}
</script>

<template>
  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasProduct" aria-labelledby="offcanvasProductLabel">
    <div class="offcanvas-header border-bottom">
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      <h5 class="offcanvas-title fw-bold" id="offcanvasProductLabel" :class="{'fs-6' : form.step == 2}">{{form.step == 1 ? "Ne satıyorsun?" : "Daha fazla detay eklemek ister misin?"}}</h5>
    </div>
    <div class="offcanvas-body off-product-body">
      <category-step :categories="categories" v-if="form.step == 1"/>
      <product-detail-step v-else-if="form.step == 2"/>
    </div>
  </div>
</template>
