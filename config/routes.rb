Rails.application.routes.draw do
  
  root 'pages#welcome'
  
  get 'pages/welcome'
  get 'pages/about'
  get 'pages/products'
  get 'pages/contact'
  get 'pages/account'
  get 'admin' => 'pages#admin'

  devise_for :admins
  devise_for :users

  resources :users
  resources :applications
  resources :aches
  resources :orders
  resources :documents
  resources :line_items
  resources :members
  resources :shareholders 
end
