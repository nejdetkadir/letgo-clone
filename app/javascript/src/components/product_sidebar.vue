<script>
import toastr from "toastr";
import draggable from "vuedraggable";

export default {
  data() {
    return{
      step: 1,
      title: "Ne satıyorsun?",
      categories: JSON.parse(this.categories_data),
      mouseOver: false,
      form: {
        selectedCategoryIndex: -1,
        images: [],
        isFree: false
      }
    }
  },
  props: ["categories_data"],
  methods: {
    handleIcon(icon) {
      return icon.substring(0, 3) + " fa" + icon.substring(3, icon.length)
    },
    onSelectCategory(index) {
      this.form.selectedCategoryIndex = index
    },
    mouseOverImageCard() {
      this.mouseOver = true
    },
    mouseOutImageCard() {
      this.mouseOver = false
    },
    productImagesCheck() {
      if (this.$refs.productImagesInput.files.length > 0 && this.$refs.productImagesInput.files.length <= 6) {
        Array.from(this.$refs.productImagesInput.files).forEach(file => {
          if (file.size > (1024 * 1024 * 5)) {
            toastr.error(`Yüklediğiniz ${this.$refs.productImagesInput.files.length == 1 ? "fotoğrafın boyutu 5MB'dan büyük." : "fotoğraflar arasında 5MB'dan büyük bir resim var."}`)
          } else if (!["image/png", "image/jpg", "image/jpeg"].includes(file.type)) {
            toastr.error(`Yüklediğiniz ${this.$refs.productImagesInput.files.length == 1 ? "fotoğraf desteklenmeyen dosya tipinde." : "fotoğraflar arasında desteklenmeyen dosya tipine ait bir resim var."}`)
          } else {
            this.form.images.push(file)
          }
        })

        if (this.form.images.length > 0) this.step = 2
        
      } else {
        this.$refs.productImagesInput.files.length > 0 ? toastr.error("En fazla 6 adet fotoğraf yükleyebilirsiniz.") : toastr.info("Lütfen resim seçiniz.") 
      }
    },
    onClickProductImagesCard() {
      this.$refs.productImagesInput.click()
    },
    handleImage(file) {
      return URL.createObjectURL(file)
    }
  },
  components: {
    draggable
  },
  watch: {
    step() {
      this.title = this.step == 1 ? "Ne satıyorsun?" : "Daha fazla detay eklemek ister misin?";
    }
  }
}
</script>

<template>
  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasProduct" aria-labelledby="offcanvasProductLabel">
    <div class="offcanvas-header border-bottom">
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      <h5 class="offcanvas-title fw-bold" :class="{'fs-6' : step == 2}" id="offcanvasProductLabel">{{title}}</h5>
    </div>
    <div class="offcanvas-body off-product-body">
      <div v-if="step == 1">
        <p class="text-secondary">Bir kategori seç</p>
        <div class="d-flex flex-wrap">
          <div class="col-4" v-for="(category, index) in categories" :key="index">
            <div class="card off-product-card" :class="{'is-selected' : index == form.selectedCategoryIndex, 'border-top-0 border-bottom-0' : (index == 3 || index == 4 || index == 5), 'border-end-0': (index == 0 || index == 1 || index == 3 || index == 4 || index == 6 || index == 7) }" @click="form.selectedCategoryIndex=index">
              <div class="card-body text-center">
                <i class="off-product-icon text-white" :class="handleIcon(category.icon)" :style="{backgroundColor: category.color}"></i>
                <p class="mb-0 mt-1">{{category.name.toUpperCase()}}</p>
              </div>
            </div>
          </div>
        </div>

        <div v-if="form.selectedCategoryIndex > -1">
          <p class="text-secondary mt-3">Fotoğraflar</p>
          <div class="card off-product-image-card" @mouseover="mouseOverImageCard" @mouseout="mouseOutImageCard" @click="onClickProductImagesCard">
            <div class="card-body text-center">
              <div class="d-block">
                <i class="fas fa-image fs-2 off-product-image-icon"></i>
                <p class="mb-0 mt-1 fs-4 fw-bold" :style="{color : mouseOver ? '#ff3f55' : '#7a7a7a'}">Gözat</p>
                <p class="p-3">İlanına 6 adete kadar fotoğraf yükleyebilirsin.</p>
                <input type="file" ref="productImagesInput" class="d-none" accept="image/png, image/jpg, image/jpeg" @input="productImagesCheck" multiple>
              </div>
            </div>
          </div>
        </div>
      </div> 

      <div v-else>
        <p class="text-secondary fw-bold">Fotoğraflar <span class="text-danger">*</span></p>
        <draggable :list="form.images" class="d-flex flex-wrap">
          <div class="col-4 p-1 off-product-draggable-image" v-for="(image, index) in form.images" :key="index+99">
            <div class="card">
              <img :src="handleImage(image)" class="card-img img-thumbnail img-thumbnail-product">
              <div class="card-img-overlay">
                <h5 class="card-title text-center">{{index == 0 ? "Kapak" : index}}</h5>
              </div>
            </div>
          </div>
        </draggable>
        <small class="text-secondary">İpucu: En az 3 fotoğraf ekle</small>
        <div class="row mt-4 off-product-form mb-4">
          <div class="col">
            <input type="text" class="border-bottom-input" placeholder="Fiyat gir" v-if="!form.isFree">
          </div>
          <div class="col">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" v-model="form.isFree">
              <label class="form-check-label">
                Ücretsiz ver
              </label>
            </div>
          </div>
        </div>
        <div class="mb-3">
          <input type="text" class="border-bottom-input" placeholder="Ürün başlığı">
        </div>
        <div class="mb-3">
          <textarea rows="5" class="border-bottom-input" placeholder="Açıklama (isteğe bağlı)"></textarea>
          <div class="text-end">/1500</div>
        </div>
        <div class="d-grid">
          <button class="btn btn-letgo">Onayla</button>
        </div>
      </div>    
    </div>
  </div>
</template>

<style>
  .off-product-draggable-image > .card > .card-img-overlay > .card-title{
    background-color: rgba(0, 0, 0, 0.56);
    color: white;
    border-radius: 50px;
    width: 50%;
    font-size: small;
  }
  
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

  .is-selected{
    background-color: #f5f5f5;
  }

  .off-product-card > .card-body > p{
    font-size: 10px;
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

  .img-thumbnail-product{
    height: 120px;
    width: 120px;
  }

  .off-product-draggable-image{
    cursor: move !important;
  }

  .off-product-form > .col > .form-check >.form-check-input:checked {
      background-color: #ff3f55;
      border-color: #ff3f55;
  }
  .off-product-form > .col > .form-check > .form-check-input:focus {
      border-color: #ff3f558c;
  }

  .border-bottom-input{
    background-color: transparent;
    border: none;
    border-bottom: 2px solid #9e9e9e;
    border-radius: 0;
    outline: none;
    width: 100%;
    font-size: 16px;
    margin: 0 0 8px 0;
    padding: 0;
  }
</style>