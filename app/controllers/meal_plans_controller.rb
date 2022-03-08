class MealPlansController < ApplicationController
  def create
    @meal_plan = MealPlan.new
    @recipe = Recipe.find(params[:recipe_id])
    @meal_plan.recipe_id = @recipe.id
    @meal_plan.user_id = current_user.id
    @meal_plan.date = Date.new(2022, 3, params["date"].to_i)
    if @meal_plan.save
      shopping_list
      redirect_to recipes_path, notice: "#{@recipe.name} has been added"
    else
      render 'recipes/show'
    end
  end

  def destroy
    @meal_plan = MealPlan.find(params[:recipe_id])
    @meal_plan.destroy
    redirect_to user_meal_plan_path, notice: 'Meal was successfully removed.'
  end

  private

  def mealplan_params
    params.require(:meal_plan).permit(:date, :day, :recipe_id)
  end

  def shopping_list
    RecipeIngredient.where(recipe_id: @recipe.id).each do |x|
      ShoppingList.create(meal_plan_id: @meal_plan.id, ingredient_id: x.ingredient.id)
    end
  end
end
