class RecipeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_name, :string
  attribute :servings, :string
  attribute :cooking_time_minutes, :integer
  attribute :instructions, :string

  # Direct associations

  has_many   :recipe_ingredients

  has_many   :recipe_reviews

  # Indirect associations
end
