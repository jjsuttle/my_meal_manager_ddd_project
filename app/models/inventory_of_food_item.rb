class InventoryOfFoodItem < ApplicationRecord
  enum purchased_status: {"need_to_purchase"=>0, "purchased"=>1} 

  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    food_name
  end

end
