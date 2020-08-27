Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:create, :show, :update]
  resources :notifications, only: [:destroy]
  get "/games/test", to: "games#home", as: "games_test" #test route - delete later
  get "/notifications/:id", to: "notifications#accept", as: "accept"
  post "/games", to: "games#create"
  patch "/games/:id/invite", to: "games#invite", as: 'invite'
  patch "/games/:id/start", to: "games#start", as: 'start_game'
  patch "/games/:game_id/answer/:user_id", to: "games#answer", as:'game_answer'
  patch "/games/:id/timeout", to: "games#timeout"
  delete "/", to: "notifications#destroy"
end