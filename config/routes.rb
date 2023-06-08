Rails.application.routes.draw do
  root 'users#show', id: 1
  resources :games, only: [:show]
  resources :users, only: [:show]
  get 'towerofhonoi', to: 'games#towerofhonoi'
  get 'tictactoe', to: 'games#tictactoe'
  get 'rockpaperscissor', to: 'games#rockpaper'
end
