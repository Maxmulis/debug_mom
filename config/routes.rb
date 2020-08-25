Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root to: 'pages#home'
  resources :tickets, only: [:index, :new, :create] do
    resources :users, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
