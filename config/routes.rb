Rails.application.routes.draw do
  get 'posters/:id/like', to: 'posters#like', as: :poster_like
  resources :posters
    
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
