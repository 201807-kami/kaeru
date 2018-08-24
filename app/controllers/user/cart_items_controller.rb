class User::CartItemsController < ApplicationController

	def create
        @cart = Cart.find_by(user_id: current_user)
		item = Item.find(params[:item_id])
		#@cart_items = @cart.item

    if CartItem.exists?(item_id: item.id)
      @cart_item = CartItem.where(item_id: item.id)
      @cart_item.quantity += 1
      @cart_item.update
      redirect_to user_cart_path, notice: 'カートに商品が追加されました。'
    elsif @cart_item = CartItem.new(item_id: item, cart_id: @cart, quantity: 1)
      @cart_item.save

         redirect_to user_cart_path(@cart), notice: 'カートに商品が追加されました。'
      else
         redirect_to user_item_path(item.id)
      end
  	end

	def destroy
    	@cart_item =CartItem.find(params[:id])
  		@cart_item.destroy
      	redirect_to user_cart_path, notice: '商品をカートから削除しました。'
  	end

    private
    # Use callbacks to share common setup or constraints between actions.
    	def set_cart_item
     	 	@cart_item = CartItem.find(params[:id])
   		end

  # 		def cart_item_params
  #    		params.require(:cart_item).permit(:item_id, :user_id)
		# end
end