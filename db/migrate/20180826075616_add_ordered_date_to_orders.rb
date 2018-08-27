class AddOrderedDateToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :ordered_date, :date
  end
end
