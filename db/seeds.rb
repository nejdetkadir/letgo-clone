# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories

User.create(email: "nejdetkadir.550@gmail.com", password: "123456789")

Category.create(name: "Elektronik", icon: "fas-mobile", color: "#6bcebb")
Category.create(name: "Spor, Eğlence ve Oyunlar", icon: "fas-basketball-ball", color: "#a3ce71")
Category.create(name: "Araba", icon: "fas-car", color: "#327fb6")
Category.create(name: "Motosiklet ve Diğer Araçlar", icon: "fas-motorcycle", color: "#fb8636")
Category.create(name: "Ev ve Bahçe", icon: "fas-couch", color: "#ffd200")
Category.create(name: "Moda ve Aksesuar", icon: "fas-shoe-prints", color: "#fd7d91")
Category.create(name: "Bebek ve Çocuk", icon: "fas-baby-carriage", color: "#20c3f3")
Category.create(name: "Film, Kitap ve Müzik", icon: "fas-headphones", color: "#ec7ebd")
Category.create(name: "Diğer", icon: "fab-buffer", color: "#e1c340")

10.times {
  User.last.products.create(
    name: Faker::Book.title,
    category: Category.active.sample,
    description: Faker::Lorem.sentence,
    price: "1500.00",
    remote_images_urls: [
      Faker::Avatar.image(slug: Faker::Book.title, size: "800x800", format: "jpg"),
      Faker::Avatar.image(slug: Faker::Book.title, size: "800x800", format: "jpg"),
      Faker::Avatar.image(slug: Faker::Book.title, size: "800x800", format: "jpg"),
      Faker::Avatar.image(slug: Faker::Book.title, size: "800x800", format: "jpg"),
      Faker::Avatar.image(slug: Faker::Book.title, size: "800x800", format: "jpg"),
      Faker::Avatar.image(slug: Faker::Book.title, size: "800x800", format: "jpg"),
    ]
  )
}
