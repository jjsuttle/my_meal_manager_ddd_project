class InventoryOfFoodItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :date_purchased, :date
  attribute :expiration_date, :date
  attribute :days_until_expiration, :integer
  attribute :purchased_status, :string_enum, allow: InventoryOfFoodItem.purchased_statuses.keys
  attribute :food_name, :string
  attribute :notes, :string

  # Direct associations

  belongs_to :user

  # Indirect associations

end
