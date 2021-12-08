class InventoryOfFoodItemsController < ApplicationController
  before_action :current_user_must_be_inventory_of_food_item_user,
                only: %i[edit update destroy]

  before_action :set_inventory_of_food_item,
                only: %i[show edit update destroy]

  # GET /inventory_of_food_items
  def index
    @q = current_user.inventory_of_food_items.ransack(params[:q])
    @inventory_of_food_items = @q.result(distinct: true).includes(:user,
                                                                  :recipe_ingredients).page(params[:page]).per(10)
  end

  # GET /inventory_of_food_items/1
  def show
    @recipe_ingredient = RecipeIngredient.new
  end

  # GET /inventory_of_food_items/new
  def new
    @inventory_of_food_item = InventoryOfFoodItem.new
  end

  # GET /inventory_of_food_items/1/edit
  def edit; end

  # POST /inventory_of_food_items
  def create
    @inventory_of_food_item = InventoryOfFoodItem.new(inventory_of_food_item_params)

    if @inventory_of_food_item.save
      message = "InventoryOfFoodItem was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @inventory_of_food_item, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /inventory_of_food_items/1
  def update
    if @inventory_of_food_item.update(inventory_of_food_item_params)
      redirect_to @inventory_of_food_item,
                  notice: "Inventory of food item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /inventory_of_food_items/1
  def destroy
    @inventory_of_food_item.destroy
    message = "InventoryOfFoodItem was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to inventory_of_food_items_url, notice: message
    end
  end

  private

  def current_user_must_be_inventory_of_food_item_user
    set_inventory_of_food_item
    unless current_user == @inventory_of_food_item.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory_of_food_item
    @inventory_of_food_item = InventoryOfFoodItem.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def inventory_of_food_item_params
    params.require(:inventory_of_food_item).permit(:user_id, :date_purchased,
                                                   :expiration_date, :days_until_expiration, :purchased_status, :food_name, :notes)
  end
end
