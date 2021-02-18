Rails.application.routes.draw do
  resources :recommendations, only: [:index, :new, :create]
  resources :friendships
  resources :visits
  
  root 'users#home'
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
  patch '/users/:id', to: 'users#update'
  get '/users/:id', to: 'users#destroy'
  get '/users/:id/myfriends', to: 'users#myfriends', as: 'myfriends'
  get '/users/:id/incoming_recs', to: 'users#incoming_recs', as: 'incoming_recs'
  get '/users/:id/outgoing_recs', to: 'users#outgoing_recs', as: 'outgoing_recs'
  post '/users/search', to: 'users#search'
  get '/users/:id/:search_display', to: "users#search_display", as:'search_display'


  patch '/visits/:id/favorite', to: 'visits#favorite'
  patch '/visits/:id/unfavorite', to: 'visits#unfavorite'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
