class AddColumnsToCarts < ActiveRecord::Migration[5.2]
  def change
  	add_column :carts, :item_id, :integer
  	add_column :carts, :quantity, :integer, default: 0
  end
end
