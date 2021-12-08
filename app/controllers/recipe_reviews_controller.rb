class RecipeReviewsController < ApplicationController
  before_action :current_user_must_be_recipe_review_reviewer, only: [:edit, :update, :destroy] 

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
      message = 'RecipeReview was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @recipe_review, notice: message
      end
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
    message = "RecipeReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to recipe_reviews_url, notice: message
    end
  end


  private

  def current_user_must_be_recipe_review_reviewer
    set_recipe_review
    unless current_user == @recipe_review.reviewer
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_review
      @recipe_review = RecipeReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_review_params
      params.require(:recipe_review).permit(:reviewer_id, :recipe_id, :rating, :review, :recipe_name)
    end
end
