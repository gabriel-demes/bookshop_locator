Rails.application.routes.draw do
  resources :recommendations
  resources :friendships
  resources :visits
  resources :bookshops
  # user login
  get '/login', to: 'users#login', as: 'login'
  post '/handle_login', to: 'users#handle_login'
  # user logout
  delete '/logout', to: 'users#logout', as: 'logout'
  # resources :users
  get '/users/', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/users/:id', to: 'users#update'
  get '/users/:id', to: 'users#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
