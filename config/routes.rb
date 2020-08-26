Rails.application.routes.draw do
  passwordless_for :users
  root to: 'pages#home'

  resources :tickets, only: [:index, :new, :create]

  get '/components_test', to: 'pages#components_test'

  get '/everything_page', to: 'pages#everything_page'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
