authenticate :user do
  scope 'uyelik', module: 'membership', as: 'membership' do
    # get '/', to: 'home#index', as: 'root'

    scope 'ilan', as: 'product' do
      get '/yeni', to: 'products#create', as: 'create'
    end
  end
end
