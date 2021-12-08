class RecipeReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :reviewer_id, :integer
  attribute :recipe_id, :integer
  attribute :rating, :float
  attribute :review, :string
  attribute :recipe_name, :string

  # Direct associations

  # Indirect associations

end
