<script>
import searchBar from "./search_bar.vue";
import { isMobile } from 'mobile-device-detect';
import {mapMutations} from "vuex";

export default {
  data() {
    return{
      isAuthenticated: this.authenticated == "true",
      isMobile
    }
  },
  props: {
    authenticated: {
      required: true,
      type: String
    }
  },
  components: {
    searchBar
  },
  methods: {
    ...mapMutations("product", ["openSidebar"]),
    onOpenSidebar() {
      this.openSidebar();
      document.body.style = "overflow: hidden; padding-right: 0px;"
    }
  }
}
</script>

<template>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top shadow" id="navbar">
    <div class="container">
      <div :class="{'col-2 text-center' : !isMobile, 'col-3' : isMobile}">
        <a href="/">
          <img src="/images/static/letgo-logo.png" :height="isMobile ? 40 : 45">
        </a>
      </div>
      <div :class="{'col-6' : !isMobile, 'col-7' : isMobile}">
        <search-bar/>
      </div>
      <div :class="{'col-4' : !isMobile, 'col-2' : isMobile}">
        <div class="d-flex justify-content-evenly">
          <button v-if="!isMobile && !isAuthenticated" class="btn btn-letgo btn-sm fw-bold" type="button" data-bs-toggle="modal" data-bs-target="#authenticationModal">
            <i class="fas fa-camera me-2"></i>
            Sat
          </button>
          <button v-if="!isMobile && isAuthenticated" class="btn btn-letgo btn-sm fw-bold" type="button" @click.prevent="onOpenSidebar">
            <i class="fas fa-camera me-2"></i>
            Sat
          </button>
          <a href="/" v-if="isAuthenticated && !isMobile" class="btn header-icon">
            <i class="fas fa-comment"></i>
          </a>
          <a href="/" v-if="isAuthenticated && !isMobile" class="btn header-icon">
            <i class="fas fa-bell"></i>
          </a>
          <button v-if="!isAuthenticated && !isMobile" class="btn btn-letgo-outline btn-sm fw-bold" type="button" data-bs-toggle="modal" data-bs-target="#authenticationModal">Giriş</button>
          <button class="btn header-icon" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasAccount" aria-controls="offcanvasAccount">
            <i class="fas fa-bars"></i>
          </button>
        </div>
      </div>
    </div>
  </nav>
</template>