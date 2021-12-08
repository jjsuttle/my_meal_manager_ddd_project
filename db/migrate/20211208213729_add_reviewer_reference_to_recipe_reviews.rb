class AddReviewerReferenceToRecipeReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_reviews, :users, column: :reviewer_id
    add_index :recipe_reviews, :reviewer_id
    change_column_null :recipe_reviews, :reviewer_id, false
  end
end
