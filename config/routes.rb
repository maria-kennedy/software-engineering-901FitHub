# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/account', to: 'users/registrations#show', as: :user_account
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect('home')

  get    'home', to: 'products#home', as: 'home'
  get    'products', to: 'products#index', as: 'products'
  get    'products/:id', to: 'products#show', as: 'product'
  get    'products/:id/edit', to: 'products#edit', as: 'edit_product'
  patch  'products/:id', to: 'products#update'
  get    'order', to: 'orders#show', as: 'order'
  get    'orders', to: 'orders#index', as: 'past_orders'
  get    'confirmation/:confirmation_num', to: 'orders#confirmation', as: 'confirmation'
  post   'products/:product_id/order_items', to: 'order_items#create', as: 'add_to_cart'
  delete 'order_items/:id', to: 'order_items#destroy', as: 'order_item'
  get    'edit_payment', to: 'payments#edit', as: 'edit_payment'
  patch  'updated_payment', to: 'payments#update', as: 'updated_payment'
  get    'checkout', to: 'payments#checkout', as: 'checkout'
  patch  'complete_order', to: 'payments#complete_order', as: 'complete_order'
  get    'purchased_products/:product_id', to: 'purchased_products#show', as: 'purchased_product'
  get    'purchased_products/:product_id/new', to: 'purchased_products#new', as: 'new_purchased_product'
  post   'purchased_products/:product_id', to: 'purchased_products#create'
  get    'products/:id/leave_a_review', to: 'products#leave_review', as: 'leave_review'
end
