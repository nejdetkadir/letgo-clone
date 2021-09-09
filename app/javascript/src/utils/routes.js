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

const cities = {
  cities: {
    path: "/uyelik/sehirler",
    type: "POST"
  },
  towns: {
    path: "/uyelik/sehirler/CITY_ID",
    type: "POST"
  },
  districts: {
    path: "/uyelik/sehirler/CITY_ID/TOWN_ID",
    type: "POST"
  }
}

module.exports = {products, categories, membership, cities};
