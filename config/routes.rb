Rails.application.routes.draw do
  get 'root', to: 'root#index'
  resources :users, only: [:new, :create, :show]
end
