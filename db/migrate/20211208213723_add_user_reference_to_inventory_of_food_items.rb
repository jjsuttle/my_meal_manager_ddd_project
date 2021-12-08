class AddUserReferenceToInventoryOfFoodItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :inventory_of_food_items, :users
    add_index :inventory_of_food_items, :user_id
    change_column_null :inventory_of_food_items, :user_id, false
  end
end
