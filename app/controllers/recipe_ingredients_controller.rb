class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: %i[show edit update destroy]

  def index
    @q = RecipeIngredient.ransack(params[:q])
    @recipe_ingredients = @q.result(distinct: true).includes(:food,
                                                             :recipe).page(params[:page]).per(10)
  end

  def show; end

  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  def edit; end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

    if @recipe_ingredient.save
      message = "RecipeIngredient was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recipe_ingredient, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recipe_ingredient.update(recipe_ingredient_params)
      redirect_to @recipe_ingredient,
                  notice: "Recipe ingredient was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe_ingredient.destroy
    message = "RecipeIngredient was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recipe_ingredients_url, notice: message
    end
  end

  private

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:recipe_id, :food_id,
                                              :ingredient_name, :quantity, :quantity_units)
  end
end
