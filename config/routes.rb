Rails.application.routes.draw do
  devise_for :admins
  resources :admins
  get 'posters/:id/like', to: 'posters#like', as: :poster_like
  resources :posters
  
  root to: "posters#index"
    
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
