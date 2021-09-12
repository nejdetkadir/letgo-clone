<script>
import Rails from "@rails/ujs";
import {products, cities} from "../../utils/routes";
import {mapState, mapMutations} from "vuex";
import {handleFormData} from "../../utils/helpers";

export default {
  data() {
    return{
      cities: [],
      towns: [],
      districts: [],
      selected: {
        city: -1,
        town: -1,
        district: -1
      }
    }
  },
  computed: {
    ...mapState("product", ["form"])
  },
  methods: {
    ...mapMutations("product", ["nextStep", "changeLoadingStatus", "setSavedProductSlug"]),
    getCities() {
      Rails.ajax({
        beforeSend: () => true,
        url: cities.cities.path,
        type: cities.cities.type,
        success: (res) => {
          if (res.length == 81) {
            this.cities = res;
          } 
        }
      });
    },
    getTowns(city_id) {
      Rails.ajax({
        beforeSend: () => true,
        url: cities.towns.path.replace("CITY_ID", city_id),
        type: cities.towns.type,
        success: (res) => {
          if (res.length > 0) {
            this.towns = res;
          }
        }
      });
    },
    getDistricts(city_id, town_id) {
      Rails.ajax({
        beforeSend: () => true,
        url: cities.districts.path.replace("CITY_ID", city_id).replace("TOWN_ID", town_id),
        type: cities.districts.type,
        success: (res) => {
          if (res.length > 0) {
            this.districts = res;
          }
        }
      });
    },
    cityChanged() {
      this.towns = [];
      this.selected.town = -1;

      this.districts = [];
      this.selected.district = -1;

      if (this.selected.city != -1) {
        this.getTowns(this.selected.city);
      }
    },
    townChanged() {
      this.districts = [];
      this.selected.district = -1;

      if (this.selected.town != -1) {
        this.districts = [];
        this.selected.district = -1;
        this.getDistricts(this.selected.city, this.selected.town);
      }
    },
    onSubmitForm() {
      if (this.selected.city != -1 && this.selected.town != -1 && this.selected.district != -1) {
        this.changeLoadingStatus(); // loading: true
        
        Rails.ajax({
          beforeSend: () => true,
          url: products.create.path,
          type: products.create.type,
          dataType: "json",
          data: handleFormData("product",
            [
              {
                name: this.form.name
              },
              {
                description: this.form.description
              },
              {
                price: this.form.price
              },
              {
                category_id: this.form.categoryId
              },
              {
                images: this.form.images
              },
              {
                quarter_id: this.selected.district
              }
            ],
            "images"
          ),
          success: (res) => {
            if (res.slug != undefined) {
              this.setSavedProductSlug(res.slug);
              this.nextStep();
            } else {
              toastr.error("Bir hata meydana geldi.");
            }
            this.changeLoadingStatus(); // loading: false
          }
        });
      }
    }
  },
  mounted() {
    this.getCities();
  }
}
</script>

<template>
  <div>
    <select class="form-select" v-model="selected.city" @change="cityChanged">
      <option value="-1" selected>Şehir seçiniz</option>
      <option :value="city.id" v-for="city in cities" :key="city.id">{{city.name}}</option>
    </select>
    <select class="form-select mt-3" v-model="selected.town" @change="townChanged" :disabled="towns.length == 0">
      <option value="-1" selected>İlçe seçiniz</option>
      <option :value="town.id" v-for="town in towns" :key="town.id">{{town.name}}</option>
    </select>
    <select class="form-select mt-3" v-model="selected.district" :disabled="districts.length == 0">
      <option value="-1" selected>Mahalle seçiniz</option>
      <optgroup :label="district.name" v-for="district in districts" :key="district.id">
        <option :value="quarter.id" v-for="quarter in district.quarters" :key="quarter.key">{{quarter.name}}</option>
      </optgroup>
    </select>
    <div class="d-grid mt-3">
      <button class="btn btn-letgo" :disabled="selected.city == -1 || selected.town == -1 || selected.district == -1 || form.isLoading" @click.prevent="onSubmitForm">{{form.isLoading ? "Yükleniyor" : "Onayla"}}</button>
    </div>
  </div>
</template>
