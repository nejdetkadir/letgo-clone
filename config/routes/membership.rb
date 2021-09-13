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

    scope 'mesajlar', as: 'messages' do
      get '/', to: 'messages#index', as: :root
      post '/:product_id/sorusor', to: 'messages#check_conversation', as: :check_conversation
      get '/:conversation_id', to: 'messages#conversation', as: :show_conversation
      post '/:conversation_id', to: 'messages#create', as: :create
    end

    scope 'ilan', as: 'product' do
      post '/yeni', to: 'products#create', as: :create
      post '/:id', to: "products#status", as: :status
    end
  end
end
