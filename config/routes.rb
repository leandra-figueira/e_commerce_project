Rails.application.routes.draw do

  get 'contact/contact'

  # get 'about/about'
  get 'home/index'
  get '/about', to: 'about#about', as: 'about'
  get '/contact', to: 'contact#contact', as: 'contact'

  root to: 'home#index'

  resources :categories, only:[:show]
  # root to: 'home#index'
  # root to: 'categories#home/index'

  resources :products, only: [:index, :show]
  # root to: 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
