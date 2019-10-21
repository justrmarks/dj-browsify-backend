Rails.application.routes.draw do
  resources :songs, only: [:create, :destroy]
  resources :users, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'songs/:username', to: 'songs#get_by_user'
end
