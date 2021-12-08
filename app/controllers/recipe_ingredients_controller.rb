class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /recipe_ingredients
  def index
    @q = RecipeIngredient.ransack(params[:q])
    @recipe_ingredients = @q.result(:distinct => true).includes(:food, :recipe).page(params[:page]).per(10)
  end

  # GET /recipe_ingredients/1
  def show
  end

  # GET /recipe_ingredients/new
  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  # GET /recipe_ingredients/1/edit
  def edit
  end

  # POST /recipe_ingredients
  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

    if @recipe_ingredient.save
      message = 'RecipeIngredient was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @recipe_ingredient, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /recipe_ingredients/1
  def update
    if @recipe_ingredient.update(recipe_ingredient_params)
      redirect_to @recipe_ingredient, notice: 'Recipe ingredient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipe_ingredients/1
  def destroy
    @recipe_ingredient.destroy
    message = "RecipeIngredient was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to recipe_ingredients_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_ingredient_params
      params.require(:recipe_ingredient).permit(:recipe_id, :food_id, :ingredient_name, :quantity, :quantity_units)
    end
end
