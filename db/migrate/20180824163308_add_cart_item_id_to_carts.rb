class AddCartItemIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :cart_item, :integer
  end
end
