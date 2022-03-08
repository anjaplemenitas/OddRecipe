class ShoppingListsController < ApplicationController
  def update
    shopping_list = ShoppingList.find(params[:id])
    shopping_list.purchased = params[:shopping_list][:purchased] == "true"
    shopping_list.save
  end
end
