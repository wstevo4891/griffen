Rails.application.routes.draw do
  
  root 'pages#welcome'
  
  get 'pages/welcome'
  get 'pages/about'
  get 'pages/products'
  get 'pages/contact'

  get 'admin' => 'pages#admin'
  get 'admin/applications' => 'pages#applications'
  get 'admin/aches' => 'pages#aches'
  get 'admin/documents' => 'pages#documents'
  get 'admin/orders' => 'pages#orders'

  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users do
    resource :application, controller: 'applications'
    resource :ach, controller: 'aches'
    resource :document, controller: 'documents'
    resource :order, controller: 'orders'
  end

  resources :members
  resources :shareholders
  resources :products
end
