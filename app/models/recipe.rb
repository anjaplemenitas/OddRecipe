class Recipe < ApplicationRecord
  has_many :ingredients, through: :recipes_ingredients
  has_many :reviews

  acts_as_favoritable
end
