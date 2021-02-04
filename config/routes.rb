Rails.application.routes.draw do
  # Add your routes here

  resources :items
  resources :users
  match '/auth/:provider/callback', to: 'sessions#oauth', via: [:get, :post]
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  get '/sessions/failure', to: 'sessions#failure'
  get '/dashboard', to: 'users#dashboard'

  root 'sessions#landing'



  
end
