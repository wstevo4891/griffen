Rails.application.routes.draw do
  
  root 'pages#welcome'
  
  get 'pages/welcome'
  get 'pages/about'
  get 'pages/products'
  get 'pages/contact'

  get '/admin' => 'pages#admin'

  get '/admin/users' => 'users#index'
  get '/admin/applications' => 'pages#applications'
  get '/admin/aches' => 'pages#aches'
  get '/admin/documents' => 'pages#documents'
  get '/admin/orders' => 'pages#orders'
  get '/admin/products' => 'products#index'

  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users do
    resource :application, controller: 'applications'
    post '/application_upload' => 'applications#dropbox_upload'

    resource :ach, controller: 'aches'
    post '/ach_upload' => 'aches#dropbox_upload'

    resource :document, controller: 'documents'
    post '/document_upload' => 'documents#dropbox_upload'

    resource :order, controller: 'orders'
  end

  resources :members, :shareholders, :products
end
