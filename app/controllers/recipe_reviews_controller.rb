class RecipeReviewsController < ApplicationController
  before_action :current_user_must_be_recipe_review_reviewer,
                only: %i[edit update destroy]

  before_action :set_recipe_review, only: %i[show edit update destroy]

  def index
    @q = RecipeReview.ransack(params[:q])
    @recipe_reviews = @q.result(distinct: true).includes(:reviewer,
                                                         :recipe).page(params[:page]).per(10)
  end

  def show; end

  def new
    @recipe_review = RecipeReview.new
  end

  def edit; end

  def create
    @recipe_review = RecipeReview.new(recipe_review_params)

    if @recipe_review.save
      message = "RecipeReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recipe_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recipe_review.update(recipe_review_params)
      redirect_to @recipe_review,
                  notice: "Recipe review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe_review.destroy
    message = "RecipeReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recipe_reviews_url, notice: message
    end
  end

  private

  def current_user_must_be_recipe_review_reviewer
    set_recipe_review
    unless current_user == @recipe_review.reviewer
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_recipe_review
    @recipe_review = RecipeReview.find(params[:id])
  end

  def recipe_review_params
    params.require(:recipe_review).permit(:reviewer_id, :recipe_id, :rating,
                                          :review, :recipe_name)
  end
end
