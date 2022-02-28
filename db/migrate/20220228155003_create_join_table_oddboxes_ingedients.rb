class CreateJoinTableOddboxesIngedients < ActiveRecord::Migration[6.1]
  def change
    create_join_table :oddboxes, :ingredients do |t|
      # t.index [:oddbox_id, :ingredient_id]
      # t.index [:ingredient_id, :oddbox_id]
    end
  end
end
