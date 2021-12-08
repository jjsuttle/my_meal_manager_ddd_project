class RecipeReviewsController < ApplicationController
  before_action :set_recipe_review, only: [:show, :edit, :update, :destroy]

  # GET /recipe_reviews
  def index
    @recipe_reviews = RecipeReview.all
  end

  # GET /recipe_reviews/1
  def show
  end

  # GET /recipe_reviews/new
  def new
    @recipe_review = RecipeReview.new
  end

  # GET /recipe_reviews/1/edit
  def edit
  end

  # POST /recipe_reviews
  def create
    @recipe_review = RecipeReview.new(recipe_review_params)

    if @recipe_review.save
      redirect_to @recipe_review, notice: 'Recipe review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipe_reviews/1
  def update
    if @recipe_review.update(recipe_review_params)
      redirect_to @recipe_review, notice: 'Recipe review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipe_reviews/1
  def destroy
    @recipe_review.destroy
    redirect_to recipe_reviews_url, notice: 'Recipe review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_review
      @recipe_review = RecipeReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_review_params
      params.require(:recipe_review).permit(:reviewer_id, :recipe_id, :rating, :review, :recipe_name)
    end
end
