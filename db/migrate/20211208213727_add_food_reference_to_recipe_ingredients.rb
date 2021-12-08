class AddFoodReferenceToRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_ingredients, :inventory_of_food_items,
                    column: :food_id
    add_index :recipe_ingredients, :food_id
  end
end
