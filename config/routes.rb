Rails.application.routes.draw do
  get "/profile/:user_id", to: "users#profile", as: :profile
  root to: 'pages#home'
  get "/kids/:id/profile", to: "kids#profile", as: :kids_profile
  resources :games, only: [:index, :show]
  resources :kids, only: [:show, :create, :edit, :update, :new] do
    resources :allowed_games, only: [:create]
    get "/update_score", to: "kids#update_score"
    get "/update_level", to: "kids#update_level"
  end
  resources :allowed_games, only: [:destroy]
  devise_for :users
end
