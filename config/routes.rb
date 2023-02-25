Rails.application.routes.draw do
  devise_for :admins
  resources :admins
  get 'posters/:id/like', to: 'posters#like', as: :poster_like
  get 'posters/:id/unlike', to: 'posters#unlike', as: :poster_unlike
  get 'posters/tagged/:tag', to: "posters#tagged", as: :posters_tagged
  get 'posters/status/:status', to: "posters#status", as: :posters_status
  get 'posters/delete_likes_cookies', to: "posters#delete_likes_cookies"
  resources :posters
  
  root to: "posters#index"
    
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
