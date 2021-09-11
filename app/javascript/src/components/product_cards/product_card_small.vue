<script>
import {Splide, SplideSlide} from "@splidejs/vue-splide";
import {products} from "../../utils/routes";
import Rails from "@rails/ujs";
import toastr from "toastr";
import {handleFormData} from "../../utils/helpers";

export default {
  data() {
    return{
      product: JSON.parse(this.product_data),
      category: JSON.parse(this.category_data),
      options: {
        type: 'loop',
        perPage: 1,
        perMove: 1,
        pagination: true,
        autoplay: false
      },
      deleteModalShowing: false,
      likedIt: this.liked_it == "true"
    }
  },
  // card_type == 1 admin | card_type == 2 any user
  props: ["product_data", "category_data", "card_type", "liked_it"],
  components: {
    Splide,
    SplideSlide
  },
  methods: {
    goToDetailPage() {
      if (this.product.status == "selling") window.location.href = products.view.show + this.product.slug;
    },
    goToEditPage() {
      window.location.href = products.view.edit.replace("ID", this.product.id)
    },
    changeProductStatus(status) {
      Rails.ajax({
        beforeSend: () => true,
        url: products.change_status.path.replace("ID", this.product.id),
        type: products.change_status.type,
        dataType: "json",
        data: handleFormData("product",
          [
            {
              status
            }
          ]
        ),
        success: (res) => {
          if (res.status == status) {
            this.product.status = status;

            // for toastr
            if (status == "removed") {
              toastr.success("İlan silindi.");
            } else {
              toastr.success("İlan durumu satıldı olarak değiştirildi.");
            }

            // remove element from page
            document.querySelector(`.product-card-small[data-id="${this.product.id}"]`).parentNode.remove();

            // close modal
            this.closeDeleteModal();
            
          } else if (res.error != undefined) {
            toastr.error(res.error);
          } else {
            toastr.error("Bilinmeyen bir hata meydana geldi.");
          }
        }
      });
    },
    showDeleteModal() {
      this.deleteModalShowing = true;
      document.body.classList.add("overflow-hidden");
      let el = document.createElement("div");
      el.classList.add("modal-backdrop");
      el.classList.add("show");
      document.body.appendChild(el);
    },
    closeDeleteModal() {
      this.deleteModalShowing = false;
      document.body.classList.toggle("overflow-hidden");
      document.querySelector(".modal-backdrop").remove();
    },
    onClickFavorite() {
      Rails.ajax({
        beforeSend: () => true,
        url: products.view.favorite.replace("ID", this.product.slug),
        type: "POST",
        dataType: "json",
        success: (res) => {
          this.likedIt = res.status == "unfavorited" ? false : true;
          if (res.status == "unfavorited" && document.body.contains(document.getElementById("pills-profile-tab-content"))) {
            // remove element from page
            document.querySelector(`.product-card-small[data-id="${this.product.id}"]`).parentNode.remove();
          }
        },
        error: () => {
          document.querySelector('button[data-bs-target="#authenticationModal"]').click();
        }
      });
    }
  }
}
</script>

<template>
  <div class="card product-card-small shadow" :data-id="product.id">
    <splide :options="options">
      <splide-slide v-for="(image, index) in product.images" :key="index">
        <img :src="image.small.url" :alt="product.name" class="card-img-top" @click.prevent="goToDetailPage">
      </splide-slide>
    </splide>
    <div v-if="card_type == 2" class="custom-card-img-overlay">
      <div class="card-title text-end favorite-product-btn">
        <button class="btn" :class="{'liked' : likedIt}" @click.prevent="onClickFavorite">
          <i class="fas fa-heart"></i>
        </button>
      </div>
    </div>
    <div class="card-body border-top-0">
      <h6 class="card-title" @click="goToDetailPage">{{product.name}}</h6>
      <small>{{category.name}}</small>
      <h5 class="fw-bold mt-2">{{product.price == "0.0" ? "Ücretsiz" : `${product.price} TL`}}</h5>
      <div class="d-grid mt-2">
        <button class="btn btn-letgo-outline"  v-if='product.status == "selling" && card_type == 1' @click.prevent="goToEditPage">Düzelt</button>
      </div>
      <div class="text-center edit-area mt-2" v-if='product.status == "selling" && card_type == 1'>
        <div class="btn-group dropup">
          <button type="button" class="btn" data-bs-toggle="dropdown" aria-expanded="false">
            Daha fazla seçenek
          </button>
          <ul class="dropdown-menu shadow-lg">
            <li class="dropdown-item">
              <div class="d-flex justify-content-around align-items-center">
                <i class="fas fa-share-alt"></i>
                <p class="mb-0">Paylaş</p>
              </div>
            </li>
            <li class="dropdown-item" @click.prevent="showDeleteModal">
              <div class="d-flex justify-content-around align-items-center">
                <i class="fas fa-trash"></i>
                <p class="mb-0">Sil</p>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div v-if="deleteModalShowing && card_type == 1" tabindex="-1" role="dialog" class="modal modal-alert show d-block" aria-modal="true">
        <div class="modal-dialog modal-dialog-centered delete-product-modal-dialog">
          <div class="modal-content rounded-4 shadow">
            <div class="modal-header border-bottom-0">
              <div class="d-flex justify-content-start align-items-center">
                <button class="btn-close me-2" @click.prevent="closeDeleteModal"></button>
                <h5 class="modal-title fw-bold">İlanı sil</h5>
              </div>
            </div>
            <div class="modal-body">
              <p class="mb-4">Neden ilanını silmek istiyorsun?</p>
              <div class="d-grid gap-2">
                <button class="btn btn-letgo fw-bold" @click.prevent="changeProductStatus('removed')">Bunu satmak istemiyorum</button>
                <button class="btn btn-letgo fw-bold" @click.prevent="changeProductStatus('sold')">Çoktan sattım</button>
                <button class="btn btn-letgo-outline fw-bold" @click.prevent="closeDeleteModal">İptal</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
  .delete-product-modal-dialog{
    width: 420px;
  }

  .favorite-product-btn > button{
    padding: 0;
    background: #ccc;
    border-radius: 50%;
    width: 32px;
    height: 32px;
    color: white;
  }

  .favorite-product-btn > button.liked{
    color: #ff3f55;
  }

  .favorite-product-btn > button:hover{
    background: #cccccc9e;
    color: white;
  }

  .favorite-product-btn > button.liked:hover{
    color: #ff3f55;
    background: #cccccc9e;
  }
  
  .custom-card-img-overlay {
    position: absolute;
    top: 0;
    right: 0;
    padding: 1rem;
  }
</style>
