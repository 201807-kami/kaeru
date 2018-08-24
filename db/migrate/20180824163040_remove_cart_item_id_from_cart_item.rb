class RemoveCartItemIdFromCartItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :cart_item_id, :integer
  end
end
