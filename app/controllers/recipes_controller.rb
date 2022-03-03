class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    @recipes = @recipes.where('name ILIKE ?', "%#{params[:query]}%") if params[:query].present?

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'recipes/list', locals: { recipes: @recipes }, formats: [:html] }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
  end

  def like
    @recipe = Recipe.find(params[:id])

    @recipe.favorited_by?(current_user) ? current_user.unfavorite(@recipe) : current_user.favorite(@recipe)

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :description, :method, :leftover, :storage, :substitute, :image_url)
  end
end
