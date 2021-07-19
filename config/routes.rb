Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root "users#index"
  resources :users

  post "/users/save_gender", to: "users#save_gender"
end
