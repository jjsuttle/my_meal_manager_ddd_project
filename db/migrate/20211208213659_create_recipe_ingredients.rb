class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :food_id
      t.string :ingredient_name
      t.integer :quantity
      t.integer :quantity_units

      t.timestamps
    end
  end
end
