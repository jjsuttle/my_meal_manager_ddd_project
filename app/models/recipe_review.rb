class RecipeReview < ApplicationRecord
  # Direct associations

  belongs_to :recipe

  belongs_to :reviewer,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe_name
  end

end
