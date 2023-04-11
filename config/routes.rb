Rails.application.routes.draw do
  resources :order_statuses
  resources :orders
  resources :product_orders
  resources :products
  resources :customers
  resources :restaurants
  resources :employees
  resources :addresses
  devise_for :users
  root to: "home#index" 
end
