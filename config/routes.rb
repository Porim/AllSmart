Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resouces :users, only: []

  get "/profile", to: "users#profile", as: :profile
  get "/kids/:id/profile", to: "kids#profile", as: :kids_profile
  resources :games, only: [:index]
  resources :kids, only: [:show, :create, :edit, :update, :new] do
    resources :allowed_games, only: [:create]
  end
  resources :allowed_games, only: [:destroy]
end

