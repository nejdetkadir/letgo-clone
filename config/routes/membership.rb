authenticate :user do
  scope 'uyelik', module: 'membership', as: 'membership' do
    get '/', to: 'home#index', as: :root
    
    scope 'ayarlar', as: 'settings' do
      get '/', to: 'settings#index', as: 'root'
      patch '/profile_image', to: 'settings#update_profile_image', as: :profile_image
      patch '/informations', to: 'settings#informations', as: :informations
    end

    scope 'ilan', as: 'product' do
      post '/yeni', to: 'products#create', as: :create
      post '/:id', to: "products#status", as: :status
    end
  end
end
