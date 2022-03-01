class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews

  acts_as_favoritable

  def rating
    review_sum = reviews.map(&:rating)

    (review_sum.sum.to_f / review_sum.count).round
  end
end
