Rails.application.routes.draw do
  root 'pages#home'
  resources :games, only: [:show]
  resources :users, except: [:new]
  get 'tictactoe', to: 'games#tictactoe'
  get 'rockpaperscissor', to: 'games#rockpaper'
end
