Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/:id/meal_plan', to: 'users#meal_plans', as: 'user_meal_plan'
  get 'users/:id/oddbook', to: 'users#oddbook', as: 'user_oddbook'
  get 'users/:id/shoppinglist', to: 'users#shopping_list', as: 'user_shopping_list'
  get 'users/:id/addoddbox', to: 'users#add_odd_box', as: 'user_add_odd_box'

  get  'recipes/:id/like', to: 'recipes#like', as: 'like_recipe'
  post 'recipes/:id/like', to: 'recipes#like'

  resources :oddboxes, only: %i[show]
  resources :users, only: %i[show]
  resources :shopping_lists, only: %i[update]

  resources :recipes, only: %i[index show] do
    resources :reviews, only: %i[new create]

    resources :meal_plans, only: %i[create destroy]
  end
end
