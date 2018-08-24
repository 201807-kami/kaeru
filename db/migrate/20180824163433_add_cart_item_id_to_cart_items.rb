class AddCartItemIdToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :cart_item_id, :integer
  end
end
