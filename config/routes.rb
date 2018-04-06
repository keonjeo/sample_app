Rails.application.routes.draw do

  get 'sessions/new'

  # root 'application#hello'
  root 'static_pages#home'


  get '/home',                   to: 'static_pages#home'
  get '/help',                   to: 'static_pages#help'
  get '/about',                  to: 'static_pages#about'
  get '/signup',                 to: 'users#new'
  post '/signup',                to: 'users#create'
  get '/login',                  to: 'sessions#new'
  post '/login',                 to: 'sessions#create'
  delete '/logout',              to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :account_activations,                        only: [:edit]
end
