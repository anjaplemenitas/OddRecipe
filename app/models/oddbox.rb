class Oddbox < ApplicationRecord
  belongs_to :user

  has_many :oddbox_ingredients
  has_many :ingredients, through: :oddbox_ingredients

  def recipes
    recipes = Recipe.all

    odd_ing_name = ingredients.map(&:name)

    recs = recipes.map do |recipe|
      rec_ing_name = recipe.ingredients.map(&:name)

      sum_ing = rec_ing_name.map do |ing|
        odd_ing_name.include?(ing)
      end

      recipe if sum_ing.count(true).positive?
    end
    recs.compact!
  end
end
