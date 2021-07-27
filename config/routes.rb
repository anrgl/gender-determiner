Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root "users#index"
  resources :users

  patch "/users/:id/check_gender", to: "users#check_gender", as: "check_gender"

  patch "/users/save_gender", to: "users#save_gender"

end
