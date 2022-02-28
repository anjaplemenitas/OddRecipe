class CreateOddboxIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :oddbox_ingredients do |t|
      t.references :oddbox, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
