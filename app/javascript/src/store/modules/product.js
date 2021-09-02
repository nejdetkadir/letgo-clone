const product = {
  namespaced: true,
  state: () => ({
    form: {
      isLoading: false,
      step: 1,
      images: [],
      categoryId: -1,
      price: "",
      isFree: false,
      name: "",
      description: "",
    }
  }),
  mutations: {
    setCategoryId(state, id) {
      state.form.categoryId = id;
    },
    pushImage(state, file) {
      state.form.images.push(file);
    },
    nextStep(state) {
      state.form.step = 2;
    }
  },
  actions: {}
};

export default product;