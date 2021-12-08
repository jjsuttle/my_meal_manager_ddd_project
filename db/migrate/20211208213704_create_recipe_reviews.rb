class CreateRecipeReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_reviews do |t|
      t.integer :reviewer_id
      t.integer :recipe_id
      t.float :rating
      t.text :review
      t.string :recipe_name

      t.timestamps
    end
  end
end
