Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:create, :show, :update]
  get "/games/test", to: "games#index", as: "games_test" #test route - delete later
  post "/games", to: "games#create" 
  patch "/games/:id/start", to: "games#start", as: 'start_game'
  patch "/games/:id/answer", to: "games#answer" 
  patch "/games/:id/timeout", to: "games#timeout" 
end
