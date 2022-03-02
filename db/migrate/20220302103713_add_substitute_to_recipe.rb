class AddSubstituteToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :substitute, :text
  end
end
