class MealPlan < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :shopping_lists

  def purchased?
    purchased ? 1 : 0
  end
end
