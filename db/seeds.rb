# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# import all static data
Rake::Task['import:all'].invoke

# Categories
Category.create(name: "Elektronik", icon: "fas-mobile", color: "#6bcebb", description: "Her gün gelişmekte olan teknoloji hayatımızın büyük bir parçası haline gelirken elektronik ürünlere olan ilgimiz ve ihtiyacımız da arttı. Telefondan televizyona, hoparlörlerden kulaklıklara, fotoğraf makinelerinden bilgisayara, drone’lardan retro kameralara birçok ikinci el elektronik ürün #{Setting.title.downcase}’da. Almak istediğin ürünün sıfırını almak yerine #{Setting.title.downcase}’da ikinci elini daha uygun fiyatlara, daha ucuza satın alabilirsin. Üstelik lokasyon bazlı arama sayesinde ilk olarak çevrendeki ilanlara ulaşabilir, bu sayede daha hızlı alım-satım yapabilirsin. İstersen bir arama uyarısı ayarlayarak etrafındaki yeni ilanlardan haberdar olabilirsin. Ayrıca artık kullanmadığın ya da yeni modeliyle değiştirmeyi düşündüğün elektronik eşyanı hemen ilan verebilir, #{Setting.title.downcase}'da satarak para kazanabilirsin.")
Category.create(name: "Spor, Eğlence ve Oyunlar", icon: "fas-basketball-ball", color: "#a3ce71", description: "İkinci el oyun konsolları, PC ve konsol oyunları, kutu oyunları, gamer aksesuarları, egzersiz ekipmanları, spor ve outdoor malzemeleri, eliptik bisiklet, bisiklet çeşitleri ve çok daha fazlası çok uygun fiyatlarla #{Setting.title.downcase}’da. İster çevrendeki satıcılar tarafından her gün yayınlanan binlerce ilan arasından istediğin ürünü ara ister kullanmadığın ikinci el oyun, oyun konsolu, bisiklet, egzersiz aletleri ve spor malzemelerini #{Setting.title.downcase}'da sat, para kazan.")
Category.create(name: "Araba", icon: "fas-car", color: "#327fb6", description: "Araba almak ya da arabanı mı satmak istiyorsun? #{Setting.title.downcase}’da ikinci el araba alıp satmak çok kolay! Marka, model, motor ve paket, yıl, kilometre, vites, kasa tipi, yakıt türü, güç aktarımı, koltuk sayısı gibi geliştirilmiş filtreleri kullanarak, ikinci el otomobil ilanları arasından aradığın arabayı kolayca bulabilirsin. Hem de uygun fiyatlara! Üstelik lokasyon bazlı arama sayesinde ilk olarak çevrendeki ilanlara ulaşabilir, bu sayede daha hızlı alım-satım yapabilirsin. İstersen bir arama uyarısı ayarlayarak etrafındaki yeni ilanlardan herkesten önce haberdar olabilirsin.")
Category.create(name: "Motosiklet ve Diğer Araçlar", icon: "fas-motorcycle", color: "#fb8636", description: "Motosiklet, kamyon, tekne, scooter, karavan ve kamyon gibi tüm ikinci el araçları, ikinci el yedek parçaları ve araç aksesuarlarını #{Setting.title.downcase}’da bulabilirsin. Çevrendeki satıcılar tarafından yayınlanan ikinci el araçlarını çok uygun fiyata satın alabilir veya ikinci el aracını, kullanmadığın yedek parçaları ve araç aksesuarlarını #{Setting.title.downcase}’da satabilirsin.")
Category.create(name: "Ev ve Bahçe", icon: "fas-couch", color: "#ffd200", description: "Evini daha ferah ve daha mutlu bir yaşam alanına kolayca çevirmek ister misin? Ev ve Bahçe kategorisinde ikinci el mobilya, dekoratif aksesuarlar, mutfak gereçleri, elektrikli ev aletleri, yemek takımları, pişirme gereçleri, ev tekstili, hırdavat ve yapı malzemeleri, bahçe aletleri ve çok daha fazlasını bulabilirsin. İstersen kullanmadığın ev eşyalarını #{Setting.title.downcase}’da satabilir ve yenilerini almak için para kazanabilirsin.")
Category.create(name: "Moda ve Aksesuar", icon: "fas-shoe-prints", color: "#fd7d91", description: "İkinci el kadın ve erkek kıyafetleri, ayakkabı, çanta, takı, saat, kişisel bakım ve güzellik ürünleri, makyaj malzemeleri ve çok daha fazlası #{Setting.title.downcase}’da. En iyi tasarım markaları, trend parçalar, sınırlı sayıda spor ayakkabılar, vintage kıyafetler ve aksesuarlar, el yapımı takılar, saatler ve çok daha fazlasını #{Setting.title.downcase}’da uygun fiyata ve çok daha ucuza bulabilirsin. Milyonlarca kişi ikinci el kıyafet almak ve satmak için #{Setting.title.downcase}’da ilan veriyor. Sen de dolabını temizlediğinde artık giymediğin ve kullanmadığın giysilerini sakın atma, onları #{Setting.title.downcase}'ya koy ve para kazanmaya başla.")
Category.create(name: "Bebek ve Çocuk", icon: "fas-baby-carriage", color: "#20c3f3", description: "Tutumlu annelerin tercih ettiği birbirinden farklı ikinci el bebek ve çocuk kıyafetleri, oyuncaklar, bebek bezi, emzirme ürünleri, emzik, biberon, müslin ürünler, yürüteç, mama sandalyesi, puset, bebek arabası, anne kucağı, oto koltuğu, anne yanı bebek beşiği, park yatak, bebek battaniye, bebek küveti, monitörler, bebek telsizleri ve çok daha fazlası uygun fiyatlarla #{Setting.title.downcase}’nun Bebek ve Çocuk kategorisinde. Bebek bakımı için gerekli olan tüm ürünleri #{Setting.title.downcase}’da kolaylıkla bulabilir, çok daha ucuza alabilirsin. Bebeğin büyüdüğünde eşyalarını #{Setting.title.downcase}’da satabilir ve bu kazancını onun diğer ihtiyaçlarını karşılamak için kullanabilirsin. #{Setting.title.downcase}’da alışveriş yaparken diğer annelerin deneyimlerinden de faydalanmayı da unutma!")
Category.create(name: "Film, Kitap ve Müzik", icon: "fas-headphones", color: "#ec7ebd", description: "Boş zamanını keyifli geçirmek, günün stresini atmak için ihtiyacın olan her şey için #{Setting.title.downcase}'nun Film, Kitap ve Müzik kategorisine göz atabilirsin. İkinci el DVD ve Blu-ray'ler, yerli ve yabancı filmler, romanlar, öyküler, ders kitapları, İngilizce kitaplar, çizgi romanlar, müzik CD'leri ve müzik aletleri gibi birçok ürünü cazip fırsatlara alabilirsin. Koleksiyonunun bulması zor parçası veya hobilerin için ihtiyacın olan her şey de #{Setting.title.downcase}’da. Para kazanmak istersen seninle aynı ilgi alanlarını paylaşan diğer insanlara veya koleksiyonculara ikinci el film ve kitaplarını satabilirsin.")
Category.create(name: "Diğer", icon: "fab-buffer", color: "#e1c340")

10.times do |user|
  User.create(
    email: user == 0 ? "nejdetkadir.550@gmail.com" : Faker::Internet.email,
    password: "123456789",
    fullname: Faker::Name.name
  )

  product_progress_bar = ProgressBar.create(:title => "Fake products creating for #{User.last.fullname}", :starting_at => 0, :total => 20)

  20.times {
    User.last.products.create(
      name: Faker::Commerce.product_name,
      category: Category.active.sample,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      remote_images_urls: [
        Faker::LoremPixel.image(size: "800x800", category: "technics"),
        Faker::LoremPixel.image(size: "800x800", category: "sports"),
        Faker::LoremPixel.image(size: "800x800", category: "nature"),
        Faker::LoremPixel.image(size: "800x800", category: "cats"),
      ],
      quarter: Quarter.all.sample
    )

    product_progress_bar&.increment
  }

end
