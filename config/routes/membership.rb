authenticate :user do
  scope 'uyelik', module: 'membership', as: 'membership' do
    get '/', to: 'home#index', as: :root
    
    # scope 'ayarlar', as: 'settings' do
    #   get '/', to: 'profile#index', as: 'root'
    # end

    scope 'ilan', as: 'product' do
      post '/yeni', to: 'products#create', as: :create
      post '/:id', to: "products#status", as: :status
    end
  end
end
