Rails.application.routes.draw do
  
  get 'pages/dashboard'
  match '/users',   to: 'users#index',   via: 'get'

  
  
  
  devise_for :users, :path_prefix => 'd'
  resources :users, :controller => "users"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "resources/index"
  resources :resources
  resources :categories
  root 'pages#home'
  get "payrolls/index"
  resources :payrolls

end
