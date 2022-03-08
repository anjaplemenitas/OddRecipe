class MealPlan < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  def purchased?
    purchased ? 1 : 0
  end
end
