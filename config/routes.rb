Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :oddboxes, only: %i[show]
  resources :users, only: %i[show]

  resources :recipes, only: %i[new show edit update destroy] do
    resources :ratings, only: %i[new edit update destroy]
  end
end
