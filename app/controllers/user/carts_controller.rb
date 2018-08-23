class User::CartsController < ApplicationController
	 before_action  only: [:update, :delete]

	def page
		cart = Cart.new
        cart.user_id = current_user.id
    	cart.save
		redirect_to user_items_path
	end



  	def show
      	@cart = Cart.find(params[:id])
      	@cart_items = CartItem.where(cart_id: @cart.id)
  		#@carts = current_cart
  		#@item = item.find(params[:item_id])
		#@cart_item = @cart.cart_items.

    	# @cart_item.quantity += params[:quantity].to_i
    	@cart.cart_items.each do |cart_item|
    	@price += cart_item.item.price*cart_item.quantity
  	end

  	def update
   	 	#@cart_item.update(quantity: params[:quantity].to_i)
    	#redirect_to current_cart
  	end

  	def destroy
    	@cart = current_cart
   	 	@cart.destroy
    	session[:cart_id] = nil
      	redirect_to user_items_path, notice: 'カートが空になりました。'
    	end
  	end

 private


  	#def setup_cart_item!
   	 	#@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  	#end
 	def cart_params
  		params.require(:cart).permit(:item_id, :user_id,)
  	end
end


