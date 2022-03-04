class UsersController < ApplicationController
  def show
    @oddbox = current_user.oddbox
  end

  def meal_plans
    @user = current_user
    @meal_plan = MealPlan.where(user_id: @user.id).sort_by(&:date)

    # if params[:date].present?
    #   @meal_plans_date = MealPlan.where(date: params[:date])
    # else
      # @meal_plan = MealPlan.where(user_id: @user.id).sort_by(&:date)
    # end
  end

  def oddbook
    @recipes = current_user.all_favorited
  end
end
