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
    # @odd_ingredients = current_user.oddbox.ingredients
    # @all_meal_plans_dates = current_user.meal_plan(current_user).sort_by(&:date).map(&:date)
    # @meal_plan = current_user.meal_plan(current_user)

    # if params["/users/#{current_user.id}/shoppinglist"].present?
    #   return if params["/users/#{current_user.id}/shoppinglist"]["Date"].empty?

    #   @date_select = date_selection(params["/users/#{current_user.id}/shoppinglist"]["Date"])


    #   tmp_arr = []

    #   @meal_plan.each do |meal|
    #     tmp_arr << meal if meal.date == @date_select
    #   end

    #   @meal_plan = tmp_arr
    # end

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

  private

  def date_selection(chosen_date)
    year = chosen_date[0, 4].to_i
    month = chosen_date[5, 7].to_i
    date = chosen_date[8, 9].to_i
    Date.new(year, month, date)
  end
end
