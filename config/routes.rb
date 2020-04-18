Rails.application.routes.draw do
  root "courses#index"

  resources :students, except: [:destroy]
  resources :logins, only: [:new, :create, :destroy]
end
