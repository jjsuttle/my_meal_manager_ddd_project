class AddRecipeReferenceToRecipeReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_reviews, :recipes
    add_index :recipe_reviews, :recipe_id
    change_column_null :recipe_reviews, :recipe_id, false
  end
end
