Rails.application.routes.draw do
  resources :recipes
  resources :recipe_ingredients
  resources :inventory_of_food_items
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
