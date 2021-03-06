Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :votes, only: [:create]
  resources :battles, only: [:index, :show, :create]
  resources :submissions, only: [:show, :create]
  resources :users, only: [:show, :create]

  get "/me", to: "users#show_session"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/endbattle/:id", to: "battles#end_battle"

  get '*path',
    to: 'fallback#index',
    constraints: ->(req) { !req.xhr? && req.format.html? }
end
