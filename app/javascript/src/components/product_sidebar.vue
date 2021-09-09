<script>
import productCategoryStep from "./product_sidebar/product_category_step.vue";
import productDetailStep from "./product_sidebar/product_detail_step.vue";
import productPublishedStep from "./product_sidebar/product_published_step.vue";
import productLocationStep from "./product_sidebar/product_location_step.vue";
import {mapState, mapMutations} from "vuex";

export default {
  data() {
    return{
      categories: JSON.parse(this.categories_data),
      titles: ["Ne satıyorsun?", "Daha fazla detay eklemek ister misin?", "Satacağın ürün nerede?"],
      visibility_status: "visible",
      closeModalOpened: false
    }
  },
  computed: {
    ...mapState("product", ["form", "sidebarOpened"]),
  },
  props: ["categories_data"],
  methods: {
    ...mapMutations("product", ["resetStep", "closeSidebar"]),
    onCloseSidebar() {
      if (this.form.step > 1 && this.form.step < 4) {
        this.closeModalOpened = true;
      } else {
        this.closeNormally();
      }
    },
    closeNormally() {
      this.closeModalOpened = false;
      this.resetStep();
      this.closeSidebar();
      document.body.style = null;
    }
  },
  components: {
    productCategoryStep,
    productDetailStep,
    productPublishedStep,
    productLocationStep
  },
  watch: {
    sidebarOpened() {
      if (!this.sidebarOpened) {
        setTimeout(() => {
          this.visibility_status = "hidden";
        }, 500);
      } else {
        this.visibility_status = "visible";
      }
    }
  }
}
</script>

<template>
  <div>
    <div class="offcanvas offcanvas-end" :class="{'show visible': sidebarOpened}" :style="{visibility: visibility_status}" :aria-modal="sidebarOpened" tabindex="-1" id="offcanvasProduct" aria-labelledby="offcanvasProductLabel">
      <div class="offcanvas-header" :class="{'border-bottom' : form.step != 3}">
        <button type="button" class="btn-close text-reset" @click.prevent="onCloseSidebar"></button>
        <h5 class="offcanvas-title fw-bold" id="offcanvasProductLabel" v-if="form.step != 4" :class="{'fs-6' : form.step == 2}">{{titles[form.step - 1]}}</h5>
      </div>
      <div class="offcanvas-body off-product-body">
        <product-category-step :categories="categories" v-if="form.step == 1"/>
        <product-detail-step v-else-if="form.step == 2"/>
        <product-location-step v-else-if="form.step == 3"/>
        <product-published-step v-else/>
      </div>
    </div>
    <div v-if="closeModalOpened" class="modal fade show d-block" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-4 shadow close-modal-content">
          <div class="modal-body text-center">
            <h5 class="mb-0 fw-bold">İlan yüklenmedi</h5>
            <p class="mb-0 mt-2">Hala yayınlamak istiyor musun?</p>
          </div>
          <div class="row p-3">
            <div class="col-6 d-grid">
              <button @click.prevent="closeNormally" class="btn btn-letgo-outline fw-bold">Sil</button>
            </div>
            <div class="col-6 d-grid">
              <button @click.prevent="closeModalOpened=false" class="btn btn-letgo fw-bold">İlanı yükle</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="offcanvas-backdrop fade show" v-if="sidebarOpened"></div>
  </div>
</template>

<style>
  .close-modal-content{
    width: 70% !important;
  }
</style>
