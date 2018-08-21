class User::CartItemsController < ApplicationController

	def create

		@cart = Cart.find_by(user_id: current_user.id)
		item = Item.find(params[:item_id])
		#@cart_item = @cart.add_item(item.id)
		@cart_item = CartItem.new(cart_id: @cart.id,item_id: item.id, quantity: 1)

		@cart_items = @cart.cart_items

		if @cart_items.include?(@cart_item)
			 current_item.idncrement(:quantity, 1)
		else
			current_item = cart_items.build(item_id: item_id)
		  if @cart_item.save
	         redirect_to user_cart_path(@cart), notice: 'カートに商品が追加されました。'
	      else
	         redirect_to user_item_path(item.id)
	      end
		end
		#binding.pry

	end

	def destroy
    	@cart_item.destroy

      	redirect_to cart_url(@cart_item.cart_id), notice: '商品をカートから削除しました。'
  	end

    private
    # Use callbacks to share common setup or constraints between actions.
    	def set_cart_item
     	 	@cart_item = CartItem.find(params[:id])
   		end

    # Never trust parameters from the scary internet, only allow the white list through.
    	#def cart_item_params
      		#params.require(:cart_item).permit(:item_id, :cart_id)
    	#end

    	#def add_item(item_id)

			#current_item = cart_items.find_by_item_id(item_id)

			#if current_item
				#current_item.idncrement(:quantity, 1)

			#else
				#current_item = cart_items.build(item_id: item_id)
			#end
			#current_item

		#end
end