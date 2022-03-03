Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'user_root', to: redirect("users/:id")

  resources :oddboxes, only: %i[show]
  resources :users, only: %i[show]

  get '/users/:id/meal_plan', to: 'users#meal_plans', as: 'user_meal_plan'
  get 'users/:id/oddbook', to: 'users#oddbook', as: 'user_oddbook'

  get  'recipes/:id/like', to: 'recipes#like'
  post 'recipes/:id/like', to: 'recipes#like', as: 'like_recipe'

  resources :recipes, only: %i[index new show edit update destroy] do
    resources :ratings, only: %i[new edit update destroy]
     resources :meal_plans, only: %i[create]
  end
end
