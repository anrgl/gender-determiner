Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root "users#index"
  resources :users

  post "/users/:id/check_gender", to: "users#check_gender", as: "check_gender"

  post "/users/save_gender", to: "users#save_gender"

end
