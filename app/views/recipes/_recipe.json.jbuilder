json.extract! recipe, :id, :recipe_name, :servings, :cooking_time_minutes, :instructions, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
