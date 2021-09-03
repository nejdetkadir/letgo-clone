<script>
import {mapState, mapMutations} from "vuex";
import draggable from "vuedraggable";
import fileInput from "./file_input.vue";
import { required, maxLength } from "vuelidate/lib/validators";
import Rails from "@rails/ujs";
import {products} from "../../utils/routes";

export default {
  data() {
    return{
      inputForm: {
        price: "",
        isFree: false,
        name: "",
        description: "",
        isDisabled: false,
      },
      validations: {
        maxDescriptionLength: 1500,
      }
    }
  },
  computed: {
    ...mapState("product", ["form"])
  },
  methods: {
    ...mapMutations("product", ["nextStep", "changeSavedStatus", "changeLoadingStatus"]),
    handleImage(file) {
      return URL.createObjectURL(file)
    },
    handleFormData() {
      const data = new FormData();

      data.append("product[name]", this.inputForm.name);
      data.append("product[description]", this.inputForm.description);
      data.append("product[price]", this.inputForm.isFree ? "0" : this.inputForm.price);
      data.append("product[category_id]", this.form.categoryId);
      this.form.images.forEach(image => {
        data.append("product[images][]", image);
      });
      
      return data;
    },
    onSubmitForm() {
      this.$v.$touch()
      if (!this.$v.$invalid) {
        this.changeLoadingStatus(); // loading: true
        
        Rails.ajax({
          beforeSend: () => true,
          url: products.create.path,
          type: products.create.type,
          dataType: "json",
          data: this.handleFormData(),
          success: (res) => {
            if (res.slug != undefined) {
              this.changeSavedStatus(res.id);
              this.nextStep();
            } else {
              window.console.log(res);
            }

            this.changeLoadingStatus(); // loading: false
          }
        });
      }
    }
  },
  validations() {
    if (this.inputForm.isFree) {
      return{
        inputForm: {
          name: {
            required
          },
          description: {
            maxLength: maxLength(1500)
          }
        }
      }
    } else {
      return{
        inputForm: {
          price: {
            required
          },
          name: {
            required
          },
          description: {
            maxLength: maxLength(1500)
          }
        }
      }
    }
  },
  components: {
    draggable,
    fileInput
  }
}
</script>

<template>
  <div>
    <p class="text-secondary fw-bold">Fotoğraflar <span class="text-danger">*</span></p>
    <draggable :list="form.images" class="d-flex flex-wrap">
      <div class="col-4 p-1 off-product-draggable-image" v-for="(image, index) in form.images" :key="index+99">
        <div class="card">
          <img :src="handleImage(image)" class="card-img img-thumbnail img-thumbnail-product">
          <div class="card-img-overlay">
            <h5 class="card-title text-center">{{index == 0 ? "Kapak" : (index+1)}}</h5>
          </div>
        </div>
      </div>
    </draggable>
    <small class="text-secondary" v-if="form.images.length <= 3">İpucu: En az 3 fotoğraf ekle</small>
    <div class="d-grid mt-3 mb-3">
      <button class="btn btn-letgo-outline" @click.prevent="$refs.fileInputComponent.$el.click()"><i class="fas fa-image"></i> Daha fazla fotoğraf ekle</button>
      <file-input ref="fileInputComponent"/>
    </div>
    <div class="row mt-4 off-product-form mb-4">
      <div class="col">
        <input type="number" class="border-bottom-input" :class="{'border-bottom-error' : !$v.inputForm.price.required}" placeholder="Fiyat gir" v-model.trim="$v.inputForm.price.$model" v-if="!inputForm.isFree">
      </div>
      <div class="col">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" v-model.trim="inputForm.isFree">
          <label class="form-check-label">
            Ücretsiz ver
          </label>
        </div>
      </div>
    </div>
    <div class="mb-3">
      <input type="text" class="border-bottom-input" :class="{'border-bottom-error' : !$v.inputForm.name.required}" placeholder="Ürün başlığı" v-model.trim="$v.inputForm.name.$model">
    </div>
    <div class="mb-3">
      <textarea rows="5" class="border-bottom-input" :class="{'border-bottom-error' : !$v.inputForm.description.maxLength}" placeholder="Açıklama (isteğe bağlı)" v-model.trim="$v.inputForm.description.$model"></textarea>
      <div class="text-end">{{inputForm.description.length}}/{{validations.maxDescriptionLength}}</div>
    </div>
    <div class="d-grid">
      <button class="btn btn-letgo" :disabled="inputForm.isDisabled || $v.inputForm.$invalid || form.isLoading" @click.prevent="onSubmitForm">{{form.isLoading ? "Yükleniyor" : "Onayla"}}</button>
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
</style>