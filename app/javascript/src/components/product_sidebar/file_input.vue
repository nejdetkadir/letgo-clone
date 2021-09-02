<script>
import toastr from "toastr";
import {mapMutations, mapState} from "vuex";

export default {
  data() {
    return{
      maxImageCount: 6,
      maxImageSize: 5,
      supportedImageTypes: ["image/png", "image/jpg", "image/jpeg"],
    }
  },
  computed: {
    ...mapState("product", ["form"])
  },
  methods: {
    ...mapMutations('product', ["pushImage", "nextStep"]),
    checkImages() {
      const input = this.$refs.imageInput;

      if (this.form.step == 1) {
        if (input.files.length > 0 && input.files.length <= this.maxImageCount) {
          this.checkEveryFile(input);
          if (this.form.images.length > 0) this.nextStep();
        } else {
          this.errorOnCheck(input.files.length);
        }
      } else if (this.form.step == 2) {
        if (input.files.length > 0 && (input.files.length + this.form.images.length) <= this.maxImageCount) {
          this.checkEveryFile(input);
        } else {
          this.errorOnCheck(this.form.images.length);
        }
      }
    },
    checkEveryFile(input) {
      // checking every file for validations
      Array.from(input.files).forEach(file => {
        if (file.size > (1024 * 1024 * this.maxImageSize)) {
          toastr.error(input.files.length == 1 ? `Yüklemeye çalışılan fotoğrafın boyutu ${this.maxImageSize}MB'dan büyük.` : `Yüklemeye çalışılan fotoğraflar arasında boyutu ${this.maxImageSize}MB'dan büyük bir fotoğraf var.`);
        } else if(!this.supportedImageTypes.includes(file.type)) {
          toastr.error(input.files.length == 1 ? `Yüklemeye çalışılan dosya tipi desteklenmemektedir.` : `Yüklemeye çalışılan dosyalar arasında desteklenmeyen dosya tipi bulundu.`);
        } else {
          this.pushImage(file);
        }
      });
    },
    errorOnCheck(count) {
      this.form.step == 1 && count > 6 || this.form.step == 2 && count >= 6 ? toastr.error(`En fazla ${this.maxImageCount} adet fotoğraf yükleyebilirsiniz.`) : toastr.info("Herhangi bir resim seçmediniz.");
    }
  }
}
</script>

<template>
  <input type="file" ref="imageInput" class="d-none" :accept="supportedImageTypes" @input="checkImages" multiple>
</template>
