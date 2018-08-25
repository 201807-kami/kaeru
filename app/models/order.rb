class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items
  accepts_nested_attributes_for :order_items

	def set_attribute
    set_address
    build_order_item_from_cart
    set_amount
  end

  def set_address
    address = self.address
  end

  def build_order_item_from_cart
    self.order_items = []
    Cart.includes(:item).search(self.user).each do |cart|
      self.order_items.build(
          item_id: cart.item.id,
          price: cart.item.price,
          quantity: cart.quantity
      )
    end
  end

  def set_amount
    self.item_amount = 0
    self.order_items.each do |order_item|
      self.item_amount += order_item.price * order_item.quantity
    end
  end

  def new_order
    set_amount
    set_current_item_info
    set_sales_quantity
    set_stock
    self.save!

    cart_clear
  end



  def set_current_item_info
    self.order_items.each do |order_item|
      order_item.item_title = order_item.item.title
      order_item.price = order_item.item.price
    end
  end

  def set_sales_quantity
    self.order_items.each do |order_item|
      order_item.item.increment!(:sales_quantity, 1 * order_item.quantity)
    end
  end

  def set_stock
    self.order_items.each do |order_item|
      order_item.item.increment!(:stock, -1 * order_item.quantity)
    end
  end

  def cart_clear
    Cart.search(self.user).delete_all
  end


end
