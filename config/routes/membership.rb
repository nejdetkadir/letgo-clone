authenticate :user do
  scope 'uyelik', module: 'membership', as: 'membership' do
    get '/', to: 'home#index', as: :root

    scope 'sehirler', as: 'cities' do
      post '/', to: 'cities#cities', as: :cities
      post '/:city_id', to: 'cities#towns', as: :towns
      post '/:city_id/:town_id', to: 'cities#districts', as: :districts
    end

    scope 'ayarlar', as: 'settings' do
      get '/', to: 'settings#index', as: 'root'
      patch '/profile_image', to: 'settings#update_profile_image', as: :profile_image
      patch '/bilgiler', to: 'settings#informations', as: :informations

      scope 'bilgiler', as: 'informations' do
        get '/sil', to: 'settings#cancel', as: :cancel
        get '/veriler', to: 'settings#data', as: :data
      end
    end

    scope 'ilan', as: 'product' do
      post '/yeni', to: 'products#create', as: :create
      post '/:id', to: "products#status", as: :status
    end
  end
end
