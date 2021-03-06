Rails.application.routes.draw do
  root to: 'root#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :index, :edit, :update]
  # resources :topics, only: [:index, :show]

  resources :topics do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :teacher do
    resources :topics, only: [:new, :create, :edit, :update, :destroy]
  end
end
