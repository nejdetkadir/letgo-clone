Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', 
                                    sessions: 'users/sessions', 
                                    registrations: 'users/registrations'
                                  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  draw :membership
  
  root  to:'home#index'

  # kategori
  get '/kategori/:slug', to: "categories#show", as: :category_show

  scope 'ilan', as: 'product' do
    get '/:slug', to: "products#show", as: :show
    
    # favorites
    post '/:slug/favori', to: "products#favorite", as: :favorite
  end

  # errors
  get '/404', to: 'errors#not_found', as: :not_found
  get '/422', to: 'errors#unacceptable', as: :unacceptable
  get '/500', to: 'errors#internal_error', as: :internal_error
end
