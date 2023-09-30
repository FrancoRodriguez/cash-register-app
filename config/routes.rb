Rails.application.routes.draw do
  get 'carts/show'
  resources :products
  resources :order_products
  post 'carts/new_cart', to: 'carts#new_cart', as: 'new_cart'
  root to: "main#index"
end
