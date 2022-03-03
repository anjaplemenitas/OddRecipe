class UsersController < ApplicationController
  def show
    @oddbox = current_user.oddbox
  end

  def meal_plans
    @user = current_user
    @meal_plan = MealPlan.where(user_id: @user.id)
  end

  def oddbook
    @recipes = current_user.all_favorited
  end
end
