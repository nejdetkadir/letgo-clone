const product = {
  namespaced: true,
  state: () => ({
    form: {
      isLoading: false,
      step: 1,
      images: [],
      categoryId: -1,
      isSaved: {
        status: false,
        id: null
      }
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
        categoryId: -1,
        isSaved: {
          status: false,
          id: null
        }
      };
    },
    changeSavedStatus(state, id) {
      state.form.isSaved.status = !state.form.isSaved.status;
      state.form.isSaved.id = id;
    },
    changeLoadingStatus(state) {
      state.form.isLoading = !state.form.isLoading;
    }
  },
  actions: {}
};

export default product;