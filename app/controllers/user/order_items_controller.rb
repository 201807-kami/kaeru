class User::OrderItemsController < ApplicationController
	layout 'user'

	def index
		@orders = Order.all
	end
end
