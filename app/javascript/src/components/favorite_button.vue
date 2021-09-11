<script>
import Rails from "@rails/ujs";
import {products} from "../utils/routes";

export default {
  data() {
    return{
      likedIt: this.liked == "true"
    }
  },
  props: {
    liked: {
      required: true,
      type: String
    },
    slug: {
      required: true,
      type: String
    }
  },
  methods: {
    onFavorite() {
      Rails.ajax({
        beforeSend: () => true,
        url: products.view.favorite.replace("ID", this.slug),
        type: "POST",
        dataType: "json",
        success: (res) => {
          this.likedIt = res.status == "unfavorited" ? false : true;
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
  <button class="btn" @click.prevent="onFavorite" :class="{'text-letgo' : likedIt, 'text-secondary' : !likedIt}">
    <i class="fas fa-heart"></i>
  </button>
</template>