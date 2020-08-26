Rails.application.routes.draw do
  passwordless_for :users

  root to: 'pages#home'
  resources :tickets, only: [:index, :new, :create] do
    resources :users, only: [:index, :new, :create]
  end

  get '/users/sign_in'
  get '/components_test', to: 'pages#components_test'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
