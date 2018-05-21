Rails.application.routes.draw do
  root to: 'root#index'
  get 'login', to: 'root#login'
  resources :users, only: [:new, :create, :show]
  resources :topics, only: [:index]
end
