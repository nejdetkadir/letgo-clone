// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

// bootstrap
import "bootstrap/dist/js/bootstrap.bundle";

// toastr
global.toastr = require("toastr");

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue/dist/vue.esm";
import store from "../src/store/index";
import Vuelidate from 'vuelidate';

Vue.use(Vuelidate)
Vue.use(TurbolinksAdapter);

// components
import search_bar from "../src/components/search_bar";
Vue.component("search-bar", search_bar)

import category_splide from "../src/components/category_splide";
Vue.component("category-splide", category_splide);

import product_sidebar from "../src/components/product_sidebar";
Vue.component("product-sidebar", product_sidebar);

import product_card_small from "../src/components/product_cards/product_card_small";
Vue.component("product-card-small", product_card_small);

import profile_image_input from "../src/components/profile_image_input";
Vue.component("profile-image-input", profile_image_input);

document.addEventListener("turbolinks:load", () => {
  new Vue({
    store
  }).$mount("[data-behavior=vue]")
});
