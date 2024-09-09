Rails.application.routes.draw do
  devise_for :accounts, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"


  # Defines the root path route ("/")
  # root "posts#index"
  

  resources :books

  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/auth/login', to: 'authentication#new'

  #get '/*a', to: 'application#not_found'
end
