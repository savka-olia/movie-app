Rails.application.routes.draw do
  get "movies/index"  
  root to: "movies#index"
  resources :movies
end
