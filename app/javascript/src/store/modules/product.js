const product = {
  namespaced: true,
  state: () => ({
    form: {
      isLoading: false,
      step: 1,
      images: [],
      price: "",
      description: "",
      name: "",
      categoryId: -1,
    }
  }),
  mutations: {
    setCategoryId(state, id) {
      state.form.categoryId = id;
    },
    setFormData(state, {name, description, price}) {
      state.form.name = name;
      state.form.description = description;
      state.form.price = price;
    },
    pushImage(state, file) {
      state.form.images.push(file);
    },
    nextStep(state) {
      state.form.step++;
    },
    previousStep(state) {
      state.form.step--;
    },
    resetStep(state) {
      state.form = {
        isLoading: false,
        step: 1,
        images: [],
        price: "",
        description: "",
        name: "",
        categoryId: -1,
      }
    },
    changeLoadingStatus(state) {
      state.form.isLoading = !state.form.isLoading;
    }
  },
  actions: {}
};

export default product;