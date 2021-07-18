Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root "users#index"
  resources :users
end
