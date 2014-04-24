MixuShop::Application.routes.draw do
  root :to => 'users#index'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :users
  resources :products
  namespace :admin do
    resources :products
    resources :product_types
    resources :users
  end

end
