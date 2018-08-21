class User::CartItemsController < ApplicationController

	def create

		@cart = Cart.find_by(user_id: current_user.id)
		item = Item.find(params[:item_id])
		@cart_item = @cart.add_item(item.id)
		#binding.pry

	      if @cart_item.save
	         redirect_to user_cart_path(@cart), notice: 'カートに商品が追加されました。'
	      else
	          redirect_to user_item_path(item.id)
	      end
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
    	def cart_item_params
      		params.require(:cart_item).permit(:item_id, :cart_id)
    	end
end