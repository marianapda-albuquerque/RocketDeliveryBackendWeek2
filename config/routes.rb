Rails.application.routes.draw do
  namespace :api do
    resources :orders
    resources :couriers
    resources :courier_statuses
    resources :order_statuses

    resources :product_orders
    resources :products
    resources :customers
    resources :restaurants
    resources :employees
    resources :addresses
    devise_for :users
    # get "orders", to: "orders#index"
    
    # resources :restaurants, only: [:index]
    # resources :products, only: [:index]
    # resources :orders, only: [:index]
  end
  

  resources :couriers
  resources :courier_statuses
  resources :order_statuses

  resources :product_orders
  resources :products
  resources :customers
  resources :restaurants
  resources :employees
  resources :addresses
  devise_for :users
  root to: "home#index" 
end
