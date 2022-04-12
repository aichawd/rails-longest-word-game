Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'game', to: 'words#game'
  get 'score', to: 'words#score'
end
