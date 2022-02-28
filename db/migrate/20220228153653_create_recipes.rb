class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :cooking_time
      t.text :description
      t.text :method
      t.string :leftover
      t.string :storage

      t.timestamps
    end
  end
end
