class User::CartItemsController < ApplicationController

	def create

		@cart = current_cart
		item = Item.find(params[:item_id])
		@cart_item = @cart.add_item(item.id)
		binding.pry
	    respond_to do |format|
	      if @cart_item.save
	        format.html { redirect_to user_cart_path(@cart), notice: 'カートに商品が追加されました。' }
	      else
	        format.html { redirect_to user_item_path(item.id) }
	      end
	    end
	end

	def destroy
    	@cart_item.destroy

    	respond_to do |format|
      	format.html { redirect_to cart_url(@cart_item.cart_id), notice: '商品をカートから削除しました。' }
      	end
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