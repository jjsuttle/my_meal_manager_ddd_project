class Api::V1::RecipesController < Api::V1::GraphitiController
  def index
    recipes = RecipeResource.all(params)
    respond_with(recipes)
  end

  def show
    recipe = RecipeResource.find(params)
    respond_with(recipe)
  end

  def create
    recipe = RecipeResource.build(params)

    if recipe.save
      render jsonapi: recipe, status: 201
    else
      render jsonapi_errors: recipe
    end
  end

  def update
    recipe = RecipeResource.find(params)

    if recipe.update_attributes
      render jsonapi: recipe
    else
      render jsonapi_errors: recipe
    end
  end

  def destroy
    recipe = RecipeResource.find(params)

    if recipe.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: recipe
    end
  end
end
