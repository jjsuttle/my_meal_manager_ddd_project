class InventoryOfFoodItemsController < ApplicationController
  before_action :set_inventory_of_food_item, only: [:show, :edit, :update, :destroy]

  # GET /inventory_of_food_items
  def index
    @inventory_of_food_items = InventoryOfFoodItem.all
  end

  # GET /inventory_of_food_items/1
  def show
  end

  # GET /inventory_of_food_items/new
  def new
    @inventory_of_food_item = InventoryOfFoodItem.new
  end

  # GET /inventory_of_food_items/1/edit
  def edit
  end

  # POST /inventory_of_food_items
  def create
    @inventory_of_food_item = InventoryOfFoodItem.new(inventory_of_food_item_params)

    if @inventory_of_food_item.save
      redirect_to @inventory_of_food_item, notice: 'Inventory of food item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /inventory_of_food_items/1
  def update
    if @inventory_of_food_item.update(inventory_of_food_item_params)
      redirect_to @inventory_of_food_item, notice: 'Inventory of food item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /inventory_of_food_items/1
  def destroy
    @inventory_of_food_item.destroy
    redirect_to inventory_of_food_items_url, notice: 'Inventory of food item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_of_food_item
      @inventory_of_food_item = InventoryOfFoodItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inventory_of_food_item_params
      params.require(:inventory_of_food_item).permit(:user_id, :date_purchased, :expiration_date, :days_until_expiration, :purchased_status, :food_name, :notes)
    end
end
