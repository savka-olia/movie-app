Rails.application.routes.draw do
  devise_for :users
  get "movies/index"  
  root to: "movies#index"
  resources :movies
  resources :categories, except: [:destroy]
end
