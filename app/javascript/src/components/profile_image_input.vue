<script>
import toastr from "toastr";
import {membership} from "../utils/routes";
import {handleFormData} from "../utils/helpers";
import Rails from "@rails/ujs";

export default {
  data() {
    return{
      maxImageSize: 5,
      supportedImageTypes: ["image/png", "image/jpg", "image/jpeg"],
      imgSrc: this.img
    }
  },
  props: ["img"],
  methods: {
    updateProfileImage() {
      Rails.ajax({
        beforeSend: () => true,
        url: membership.update_profile_image.path,
        type: membership.update_profile_image.type,
        dataType: "json",
        data: handleFormData("user",
          [
            {
              profile_image: this.$refs.profileImageInput.files[0]
            }
          ]
        ),
        success: (res) => {
          if (res.imgSrc != this.imgSrc) {
            toastr.success("Profil fotoğrafı güncellendi.");
            this.imgSrc = res.imgSrc;
          } else {
            toastr.error("Profil fotoğrafı güncellenirken bir hata meydana geldi.");
          }
        }
      })
    },
    checkImage() {
      const input = this.$refs.profileImageInput;
      if (input.files.length == 1) {
        if (input.files[0].size > (1024 * 1024 * this.maxImageSize)) {
          toastr.error(`Yüklemeye çalışılan fotoğrafın boyutu ${this.maxImageSize}MB'dan büyük.`);
        } else if(!this.supportedImageTypes.includes(input.files[0].type)) {
          toastr.error("Yüklemeye çalışılan dosya tipi desteklenmemektedir.");
        } else {
          this.updateProfileImage();
        }
      } else {
        toastr.info("Herhangi bir resim seçmediniz.")
      }
    }
  }
}
</script>

<template>
  <div class="row">
    <div class="col-md-6 mx-auto">
      <input type="file" ref="profileImageInput" class="d-none" :accept="supportedImageTypes" @input="checkImage">
      <div class="d-flex justify-content-center align-items-center mt-4 update-profile-picture-area" @click.prevent="$refs.profileImageInput.click()">
        <img :src="imgSrc" class="rounded-circle img-thumbnail">
        <div class="d-block ms-3">
          <p>Fotoğrafı değiştirmek için üstüne tıkla</p>
          <small class="text-muted">Görseller PNG veya JPG uzantılı ve 5mb altında olmalıdır</small>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
  .update-profile-picture-area{
    cursor: pointer;
  }
</style>
