class Api::V1::RecipeReviewsController < Api::V1::GraphitiController
  def index
    recipe_reviews = RecipeReviewResource.all(params)
    respond_with(recipe_reviews)
  end

  def show
    recipe_review = RecipeReviewResource.find(params)
    respond_with(recipe_review)
  end

  def create
    recipe_review = RecipeReviewResource.build(params)

    if recipe_review.save
      render jsonapi: recipe_review, status: :created
    else
      render jsonapi_errors: recipe_review
    end
  end

  def update
    recipe_review = RecipeReviewResource.find(params)

    if recipe_review.update_attributes
      render jsonapi: recipe_review
    else
      render jsonapi_errors: recipe_review
    end
  end

  def destroy
    recipe_review = RecipeReviewResource.find(params)

    if recipe_review.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: recipe_review
    end
  end
end
