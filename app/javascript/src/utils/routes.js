const products = {
  create: {
    path: "/uyelik/ilan/yeni",
    type: "POST"
  },
  change_status: {
    path: "uyelik/ilan/ID",
    type: "POST"
  },
  view: {
    show: "/ilan/",
    edit: "/uyelik/ilan/ID/duzenle"
  }
}

const membership = {
  update_profile_image: {
    path: "/uyelik/ayarlar/profile_image",
    type: "PATCH"
  }
}

const categories = {
  view: {
    show: "/kategori/"
  }
}

module.exports = {products, categories, membership};
