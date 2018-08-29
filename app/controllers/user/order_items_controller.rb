class User::OrderItemsController < ApplicationController
	layout 'user'

	def index
		@order = current_user.orders.build
		user = current_user
		@orders = Order.where(user_id: current_user.id).all
	end
end
