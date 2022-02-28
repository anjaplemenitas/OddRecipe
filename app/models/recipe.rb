class Recipe < ApplicationRecord
  has_many :ingredients, through: :ingredients_recipes
  has_many :reviews

  acts_as_favoritable
end
