Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  get "/games?subject=Maths", to: "games#maths", as: :maths
  get "/games?subject=Science", to: "games#science", as: :science
  get "/games?subject=Biology", to: "games#biology", as: :biology
  get "/games?subject=English", to: "games#english", as: :english
  get "/games?subject=All", to: "games#all", as: :all_games
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
  
end
