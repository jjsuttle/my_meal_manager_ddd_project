json.extract! recipe_ingredient, :id, :recipe_id, :food_id, :ingredient_name,
              :quantity, :quantity_units, :created_at, :updated_at
json.url recipe_ingredient_url(recipe_ingredient, format: :json)
