Rails.application.routes.draw do

  get 'order/new'

  get 'order/create'

  get 'cart/index'

  get 'contact/contact'

  # get 'about/about'
  get 'home/index'
  get '/about', to: 'about#about', as: 'about'
  get '/contact', to: 'contact#contact', as: 'contact'

  root to: 'home#index'

  resources :categories, only:[:show]
  # root to: 'home#index'
  # root to: 'categories#home/index'

  resources :products, only: [:index, :show] do
    collection do
      post :clear_cart
    end
    member do
      post :add_to_cart # POST /products/:id/add_to_cart
      post :remove_from_cart  # POST /products/:id/remove_from_cart
    end
  end

  resources :cart, only: [:index] do
    collection do
      post :reload_quantity
      post :delete_item
    end
  end


  root to: 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
