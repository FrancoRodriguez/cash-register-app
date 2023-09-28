Rails.application.routes.draw do
  resources :products
  resources :order_products
  root to: "main#index"
end
