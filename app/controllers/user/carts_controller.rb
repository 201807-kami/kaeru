class User::CartsController < ApplicationController
	def show
		@cart = Cart.find(params[:id])
		@cart_items = current_cart.cart_items
	end

	def def delete_item
    @cart_item.destroy
    redirect_to current_cart
  	end

  def cart_params
  	params.require(:cart).permit(:cart_item_id, :user_id)
  end