Rails.application.routes.draw do
  # Add your routes here

  resources :items
  resources :users
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  get '/sessions/failure', to: 'sessions#failure'

  root 'welcome#landing'



  
end
