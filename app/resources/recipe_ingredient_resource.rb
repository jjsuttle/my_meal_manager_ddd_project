class RecipeIngredientResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_id, :integer
  attribute :food_id, :integer
  attribute :ingredient_name, :string
  attribute :quantity, :integer
  attribute :quantity_units, :string_enum,
            allow: RecipeIngredient.quantity_units.keys

  # Direct associations

  belongs_to :recipe

  belongs_to :food,
             resource: InventoryOfFoodItemResource

  # Indirect associations
end
