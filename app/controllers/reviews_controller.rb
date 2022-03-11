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

    empty_review?(@review)

    if @review.save
      redirect_to new_recipe_review_path(@recipe), notice: "Review added"
    else
      render :new
    end
  end

  private

  def empty_review?(review)
    @review.rating = 0 if review.rating.nil?
    @review.content = "#{current_user.first_name} did not leave a review." if review.content.empty?
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
