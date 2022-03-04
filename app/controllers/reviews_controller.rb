class ReviewsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.user_id = current_user.id
    @review.recipe_id = @recipe.id

    if @review.save
      redirect_to new_recipe_review_path(@recipe), notice: "Review added"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
