Rails.application.routes.draw do
  
  root 'pages#welcome'
  
  get 'pages/welcome'
  get 'pages/about'
  get 'pages/products'
  get 'pages/contact'
  get 'admin' => 'pages#admin'

  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users
  resources :applications
  resources :aches
  resources :orders
  resources :documents
  resources :line_items
  resources :members
  resources :shareholders
  resources :products
end
