# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories

Category.create(name: "Elektronik", icon: "fas-mobile", color: "#6bcebb")
Category.create(name: "Spor, Eğlence ve Oyunlar", icon: "fas-basketball-ball", color: "#a3ce71")
Category.create(name: "Araba", icon: "fas-car", color: "#327fb6")
Category.create(name: "Motosiklet ve Diğer Araçlar", icon: "fas-motorcycle", color: "#fb8636")
Category.create(name: "Ev ve Bahçe", icon: "fas-couch", color: "#ffd200")
Category.create(name: "Moda ve Aksesuar", icon: "fas-shoe-prints", color: "#fd7d91")
Category.create(name: "Bebek ve Çocuk", icon: "fas-baby-carriage", color: "#20c3f3")
Category.create(name: "Film, Kitap ve Müzik", icon: "fas-headphones", color: "#ec7ebd")
Category.create(name: "Diğer", icon: "fab-buffer", color: "#e1c340")

user_progress_bar = ProgressBar.create(:title => "Fake users creating with products", :starting_at => 0, :total => 10)

10.times do |user|
  User.create(
    email: user == 0 ? "nejdetkadir.550@gmail.com" : Faker::Internet.email,
    password: "123456789",
    fullname: Faker::Name.name
  )

  10.times {
    User.last.products.create(
      name: Faker::Commerce.product_name,
      category: Category.active.sample,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      remote_images_urls: [
        Faker::LoremPixel.image(size: "800x800"),
        Faker::LoremPixel.image(size: "800x800"),
        Faker::LoremPixel.image(size: "800x800"),
        Faker::LoremPixel.image(size: "800x800"),
      ]
    )
  }

  user_progress_bar&.increment
end
