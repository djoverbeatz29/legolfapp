Rails.application.routes.draw do

  resources :courses do
    resources :reviews, only: [:new, :create, :edit, :update]
  end
  resources :golfers do
    resources :rounds, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :reviews, only: [:show]
  resources :rounds, only: [:show]
  
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  root "golfers#new"

end