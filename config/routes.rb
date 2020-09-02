Rails.application.routes.draw do
  devise_for :users
  # post "/games", to: 'games#index'
    get "/games?subject=All", to: "games#all", as: :all_games
  get "/profile/:user_id", to: "users#profile", as: :profile
  root to: 'pages#home'
  get "/kids/:id/profile", to: "kids#profile", as: :kids_profile
  resources :games, only: [:index, :show]
  resources :kids, only: [:show, :create, :edit, :update, :new] do
    resources :allowed_games, only: [:create]
  end
  resources :allowed_games, only: [:destroy]
end
