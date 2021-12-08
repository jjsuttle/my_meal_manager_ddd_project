class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :servings
      t.integer :cooking_time_minutes
      t.text :instructions

      t.timestamps
    end
  end
end
