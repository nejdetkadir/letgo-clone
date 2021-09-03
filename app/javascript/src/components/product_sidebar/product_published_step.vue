<script>
import {mapMutations} from "vuex";

export default {
  methods: {
    ...mapMutations("product", ["resetStep"])
  }
}
</script>

<template>
  <div class="text-center mt-5">
    <h1>Tebrikler!</h1>
    <p class="text-secondary mt-5">Ürünün yayınlandı.</p>
    <button @click.prevent="resetStep" class="btn btn-letgo mt-4 fw-bold">Başka bir ilan yükle</button>
    <p class="mt-5"><small>Bu ilanı arkadaşlarınla paylaş</small></p>
    <div class="d-flex mt-5 justify-content-evenly align-items-center share-product-icons-group">
      <i class="fab fa-facebook"></i>
      <i class="fab fa-facebook-messenger"></i>
      <i class="fab fa-twitter"></i>
      <i class="fas fa-envelope"></i>
      <i class="fas fa-link"></i>
    </div>
  </div>
</template>

<style>
  .share-product-icons-group > i{
    padding: 10px;
    border-radius: 50%;
    color: white;
    cursor: pointer;
    font-size: 25px;
  }

  .share-product-icons-group > i.fa-facebook{
    background-color: #395796;
  }

  .share-product-icons-group > i.fa-facebook-messenger{
    background-color: #0984ff;
  }

  .share-product-icons-group > i.fa-twitter{
    background-color: #55acef;
  }

  .share-product-icons-group > i.fa-envelope{
    background-color: #bdbdbd;
  }

  .share-product-icons-group > i.fa-link{
    background-color: #5baf9f;
  }
</style>
