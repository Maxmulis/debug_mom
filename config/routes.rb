Rails.application.routes.draw do
  passwordless_for :users
  root to: 'pages#home'
  get '/components_test', to: 'pages#components_test' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
