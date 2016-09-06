Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  resources :users
  resources :identities
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  delete '/logout', to: 'sessions#destroy'
  match "/auth/failure", to: "sessions#failure", via: [:get, :post]
end
