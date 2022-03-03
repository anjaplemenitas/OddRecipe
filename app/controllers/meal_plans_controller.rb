class MealPlansController < ApplicationController

  def create
    @meal_plan = MealPlan.new
    @recipe = Recipe.find(params[:recipe_id])
    @meal_plan.recipe = @recipe
    @meal_plan.user = current_user
    if @meal_plan.save
      redirect_to user_path(current_user), notice: "Your meal has been added"
    else
      render 'recipes/show'
    end
  end

end
