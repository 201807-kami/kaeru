class User::CartsController < ApplicationController
	def show
		@cart = Cart.find(params[:id])
		@cart_items = current_cart.cart_items

  def cart_params
  	params.require(:cart).permit(:cart_item_id, :user_id)
  end