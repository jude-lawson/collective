Rails.application.routes.draw do
  root to: 'root#index'
  get 'login', to: 'session#portal'
  post 'login', to: 'user#login'
  resources :users, only: [:new, :create, :show]
  resources :topics, only: [:index]
end
