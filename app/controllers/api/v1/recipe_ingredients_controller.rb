class Api::V1::RecipeIngredientsController < Api::V1::GraphitiController
  def index
    recipe_ingredients = RecipeIngredientResource.all(params)
    respond_with(recipe_ingredients)
  end

  def show
    recipe_ingredient = RecipeIngredientResource.find(params)
    respond_with(recipe_ingredient)
  end

  def create
    recipe_ingredient = RecipeIngredientResource.build(params)

    if recipe_ingredient.save
      render jsonapi: recipe_ingredient, status: :created
    else
      render jsonapi_errors: recipe_ingredient
    end
  end

  def update
    recipe_ingredient = RecipeIngredientResource.find(params)

    if recipe_ingredient.update_attributes
      render jsonapi: recipe_ingredient
    else
      render jsonapi_errors: recipe_ingredient
    end
  end

  def destroy
    recipe_ingredient = RecipeIngredientResource.find(params)

    if recipe_ingredient.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: recipe_ingredient
    end
  end
end
