class CreateShoppingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :meal_plan, null: false, foreign_key: true
      t.boolean :purchased, default: false, null: false

      t.timestamps
    end
  end
end
