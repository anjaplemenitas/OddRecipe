class AddQuantityToRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_ingredients, :quantity, :string
  end
end
