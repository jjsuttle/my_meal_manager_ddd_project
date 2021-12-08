class CreateInventoryOfFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_of_food_items do |t|
      t.integer :user_id
      t.date :date_purchased
      t.date :expiration_date
      t.integer :days_until_expiration
      t.integer :purchased_status
      t.string :food_name
      t.text :notes

      t.timestamps
    end
  end
end
