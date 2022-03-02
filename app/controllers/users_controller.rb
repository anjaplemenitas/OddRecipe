class UsersController < ApplicationController
  def meal_plans
    @user = current_user
    @meal_plan = MealPlan.where(user_id: @user.id)
  end
end
