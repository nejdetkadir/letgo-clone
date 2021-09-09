<script>
import { isMobile } from 'mobile-device-detect';

export default {
  data() {
    return{
      icon: {
        backgroundColor: "#f5f5f5"
      },
      input: {
        backgroundColor: "#f5f5f5"
      }
    }
  },
  methods: {
    addBorder() {
      this.icon = {
        backgroundColor: "white",
        border: "1px solid #949494",
        borderRight: "none"
      }

      this.input = {
        backgroundColor: "white",
        border: "1px solid #949494",
        borderLeft: "none"
      }
    },
    removeBorder() {
      this.input = {
        backgroundColor: "#f5f5f5"
      }
      this.icon = {
        backgroundColor: "#f5f5f5"
      }
    },
    onSearch() {
      window.console.log("onSearch")
    },
  }
}
</script>

<template>
  <form>
    <div class="input-group">
      <span class="input-group-text" :style="icon"><i class="fas fa-search"></i></span>
      <input type="search" name="search[q]" :style="input" class="form-control" placeholder="letgo'da ara" @focus="addBorder" @blur="removeBorder" @keyup.enter="onSearch">
    </div>
  </form>
</template>

<style scoped>
  .input-group-text, .form-control{
    border-color: #f5f5f5;
  }

  .input-group-text{
    border-bottom-left-radius: 10px;
    border-top-left-radius: 10px;
    border-right: none;
  }

  i{
    color: #949494;
  }

  .form-control{
    border-bottom-right-radius: 10px;
    border-top-right-radius: 10px;
    border-left: none;
  }
</style>
