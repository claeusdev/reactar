Rails.application.routes.draw do

  root "pages#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]

      post "/join", to: "users#create"
      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
    end
  end

  get "*path", to: "pages#index", via: :all
end
