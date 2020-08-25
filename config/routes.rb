Rails.application.routes.draw do
  root to: 'pages#home'
  resources :tickets, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
