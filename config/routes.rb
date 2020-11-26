Rails.application.routes.draw do
  devise_for :users
  get "/profile/:user_id", to: "users#profile", as: :profile
  root to: 'pages#home'
  resources :games, only: [:index, :show]
  resources :kids, only: [:show, :create, :edit, :update, :new, :profile, :destroy] do
    get "/profile", to: "kids#profile"
    resources :allowed_games, only: [:create]
    get "/update_score", to: "kids#update_score"
    get "/update_level", to: "kids#update_level"
  end
  resources :allowed_games, only: [:destroy]
  resources :users do
    member do
      get :confirm_email
    end
  end
end
