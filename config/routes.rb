Rails.application.routes.draw do
  root to: 'root#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  resources :users, only: [:new, :create, :show, :index]
  resources :topics, only: [:index, :show]

  namespace :teacher do
    resources :topics, only: [:new, :create, :edit, :update]
  end
end
