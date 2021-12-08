class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).includes(:recipe_reviews,
                                                  :recipe_ingredients).page(params[:page]).per(10)
  end

  def show
    @recipe_ingredient = RecipeIngredient.new
    @recipe_review = RecipeReview.new
  end

  def new
    @recipe = Recipe.new
  end

  def edit; end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: "Recipe was successfully destroyed."
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :servings,
                                   :cooking_time_minutes, :instructions)
  end
end
