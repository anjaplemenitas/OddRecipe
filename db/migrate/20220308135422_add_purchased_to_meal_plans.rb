class AddPurchasedToMealPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_plans, :purchased, :boolean, null: false, default: false
  end
end
