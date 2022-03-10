class UsersController < ApplicationController
  def show
    @oddbox = current_user.oddbox
  end

  def add_odd_box
    @oddbox = Oddbox.create(name: "Medium Oddbox", user_id: current_user.id)

    ["Avocado",
     "Beetroots",
     "Cavolo nero",
     "Brussels sprouts",
     "Carrots",
     "Cucumbers",
     "Ginger",
     "Limes",
     "Mango"].each do |ing|
       OddboxIngredient.create(oddbox_id: @oddbox.id, ingredient_id: Ingredient.find_by(name: ing).id)
     end

    redirect_to oddbox_path(current_user)
  end

  def meal_plans
    @user = current_user
    if params[:previous_date].present? && params[:previous_date] == params[:date]
      @meal_plan = @user.meal_plan(@user)
    elsif params[:date].present?
      date = Date.new(2022, 03, params[:date].to_i)
      @meal_plan = @user.meal_plan(@user)
      @meal_plan = MealPlan.where(id: @meal_plan.map(&:id)).where(date: date)
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
    @user = current_user
    @meal_plan = @user.meal_plan(@user)
  end
end
