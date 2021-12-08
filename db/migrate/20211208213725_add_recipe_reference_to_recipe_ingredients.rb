class AddRecipeReferenceToRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_ingredients, :recipes
    add_index :recipe_ingredients, :recipe_id
    change_column_null :recipe_ingredients, :recipe_id, false
  end
end
