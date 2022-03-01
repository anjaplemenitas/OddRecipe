class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :oddbox_ingredients
  has_many :oddboxes, through: :oddbox_ingredients
end
