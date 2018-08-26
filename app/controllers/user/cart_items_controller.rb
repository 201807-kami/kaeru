class User::CartItemsController < ApplicationController

	# def create
 #        @cart = Cart.find_by(user_id: current_user)
	# 	item = Item.find(@item)
 #         binding.pry
	# 	#@cart_items = @cart.item

 #    if CartItem.exists?(item_id: item.id)
 #      @cart_item = CartItem.where(item_id: item.id)
 #      @cart_item.quantity += 1
 #      @cart_item.update
 #      redirect_to user_items_path, notice: 'カートに商品が追加されました。'
 #    elsif @cart_item = CartItem.new(cart_params)
 #      @cart_item.save
 #         redirect_to user_items_path, notice: 'カートに商品が追加されました。'
 #      else
 #         redirect_to user_item_path(item.id)
 #      end
 #  	end

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