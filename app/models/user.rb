class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :recipes, through: :meal_plan

  has_one :oddbox

  acts_as_favoritor

  def meal_plan(user)
    MealPlan.where(user_id: user.id).sort_by(&:date)
  end
end
