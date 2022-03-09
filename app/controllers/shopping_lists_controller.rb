class ShoppingListsController < ApplicationController
  def update
    shopping_list = ShoppingList.find(params[:id])
    shopping_list.purchased = !params[:shopping_list].nil?

    if shopping_list.save
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.json { render partial: 'users/list', locals: { recipe: Recipe.find(shopping_list.meal_plan.recipe_id), meal_plan: MealPlan.find(shopping_list.meal_plan.id) }, formats: [:html] }
      end
    end

    # redirect_to user_shopping_list_path(current_user)
  end
end
