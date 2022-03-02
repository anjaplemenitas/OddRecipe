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

      recipe if sum_ing.count(true) >= 1
    end
    sort_recipes(recs.compact!).first(5)
  end

  private

  def sort_recipes(recipes)
    recipes.sort_by(&:rating).reverse
  end
end
