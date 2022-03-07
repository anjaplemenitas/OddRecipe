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
    # This will convert @reciepes from an array to an ActiveRecord_Relation
    # which is needed to run SQL queries on
    @recipes = Recipe.where(id: @recipes.map(&:id))

    @recipes = @recipes.where('name ILIKE ?', "%#{params[:query]}%") if params[:query].present?

    respond_to do |format|
      format.html
      format.text { render partial: 'recipes/list', locals: { recipes: @recipes }, formats: [:html] }
    end
  end
end
