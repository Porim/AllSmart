Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resouces :users, only: []
  get "/profile", to: "users#profile", as: :profile
  resources :games, only: [:show, :index]
  resources :kids, only: [:show, :create, :index, :edit, :update, :new] do
  resources :allowed_games, only: [:index, :show, :create, :destroy, :new]
  end
end
