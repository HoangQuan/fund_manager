MixuShop::Application.routes.draw do
  root :to => 'users#index'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :users
  resources :products, only: [:show, :index]
  resources :revenues, only: [:show, :index]
  resources :spendings, only: [:show, :index]
  resources :total_cashes, only: [:show, :index]
  resources :admins
  namespace :admin do
    resources :revenues
    resources :total_cashes
    resources :spendings
    resources :products
    resources :product_types
    resources :users
  end

end
