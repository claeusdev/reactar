Rails.application.routes.draw do
  resources :users, only: [:create]

  post "/join", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
