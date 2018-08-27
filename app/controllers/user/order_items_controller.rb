class User::OrderItemsController < ApplicationController
	layout 'user'

	def index
		@order_items = Order.all
	end
end
