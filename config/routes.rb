Rails.application.routes.draw do
  resources :recommendations, only: [:index, :new, :create]
  resources :friendships
  resources :visits
  
  # resources :bookshops
  get '/bookshops', to: 'bookshops#index', as: 'bookshops'
  get '/bookshops/new', to: 'bookshops#new', as: 'new_bookshop'
  post '/bookshops', to: 'bookshops#create'
  get '/bookshops/:id', to: 'bookshops#show', as: 'bookshop'
  get '/bookshops/:id/edit', to: 'bookshops#edit', as: 'edit_bookshop'
  get '/bookshops/:id', to: 'users#update'
  get '/bookshops/:id', to: 'users#destroy'
  post '/bookshops/search', to: 'bookshops#search'
  get '/bookshops/search/:search_zip', to: 'bookshops#display', as: 'display_search'

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
