class UsersController < ApplicationController
  def show
    @oddbox = current_user.oddbox
  end

  def meal_plans
    @user = current_user
    if params[:previous_date].present? && params[:previous_date] == params[:date]
      @meal_plan = @user.meal_plan(@user)
    elsif params[:date].present?
      date = Date.new(2022, 03, params[:date].to_i)
      @meal_plan = MealPlan.where(date: date)
    else
      @meal_plan = @user.meal_plan(@user)
    end
  end

  def oddbook
    @recipes = current_user.all_favorited
    # This will convert @reciepes from an array to an ActiveRecord_Relation
    # which is needed to run SQL queries on
    @recipes = Recipe.where(id: @recipes.map(&:id))

    @recipes = @recipes.where('name ILIKE ?', "%#{params[:query]}%") if params[:query].present?

    respond_to do |format|
      format.html
      format.text { render partial: 'recipes/list', locals: { recipes: @recipes }, formats: [:html] }
    end
  end

  def shopping_list
    @odd_ingredients = current_user.oddbox.ingredients
    @meal_plan = current_user.meal_plan(current_user)
  end
end
