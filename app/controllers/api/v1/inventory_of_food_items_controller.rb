class Api::V1::InventoryOfFoodItemsController < Api::V1::GraphitiController
  def index
    inventory_of_food_items = InventoryOfFoodItemResource.all(params)
    respond_with(inventory_of_food_items)
  end

  def show
    inventory_of_food_item = InventoryOfFoodItemResource.find(params)
    respond_with(inventory_of_food_item)
  end

  def create
    inventory_of_food_item = InventoryOfFoodItemResource.build(params)

    if inventory_of_food_item.save
      render jsonapi: inventory_of_food_item, status: :created
    else
      render jsonapi_errors: inventory_of_food_item
    end
  end

  def update
    inventory_of_food_item = InventoryOfFoodItemResource.find(params)

    if inventory_of_food_item.update_attributes
      render jsonapi: inventory_of_food_item
    else
      render jsonapi_errors: inventory_of_food_item
    end
  end

  def destroy
    inventory_of_food_item = InventoryOfFoodItemResource.find(params)

    if inventory_of_food_item.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: inventory_of_food_item
    end
  end
end
