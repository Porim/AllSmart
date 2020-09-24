Rails.application.routes.draw do
  devise_for :users
  get "/profile/:user_id", to: "users#profile", as: :profile
  root to: 'pages#home'
  resources :allowed_games, only: [:create]
  resources :games, only: [:index, :show]
  resources :kids, only: [:show, :create, :edit, :update, :new, :profile] do
    get "/profile", to: "kids#profile"
    get "/update_score", to: "kids#update_score"
    get "/update_level", to: "kids#update_level"
  end
  resources :allowed_games, only: [:destroy]
end
