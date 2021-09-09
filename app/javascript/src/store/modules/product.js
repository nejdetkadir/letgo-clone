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
      categoryIndex: -1
    },
    sidebarOpened: false
  }),
  mutations: {
    setCategoryId(state, {id, index}) {
      state.form.categoryId = id;
      state.form.categoryIndex = index;
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
        categoryIndex: -1
      }
    },
    changeLoadingStatus(state) {
      state.form.isLoading = !state.form.isLoading;
    },
    openSidebar(state) {
      state.sidebarOpened = true;
    },
    closeSidebar(state) {
      state.sidebarOpened = false;
    }
  },
  actions: {}
};

export default product;