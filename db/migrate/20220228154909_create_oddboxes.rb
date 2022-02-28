class CreateOddboxes < ActiveRecord::Migration[6.1]
  def change
    create_table :oddboxes do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
