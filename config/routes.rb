Rails.application.routes.draw do
  root 'pages#home'
  resources :games, only: [:show]
  get 'tictactoe', to: 'games#tictactoe'
  get 'rockpaperscissor', to: 'games#rockpaper'
end
