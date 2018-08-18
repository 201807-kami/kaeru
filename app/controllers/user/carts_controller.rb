class User::CartsController < ApplicationController


  def show
    @cart_items = current_cart.cart_items
    @cart_item.quantity += params[:quantity].to_i
  end

  def update
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
  def cart_params
  	params.require(:cart).permit(:quantity, :item_id, :user_id)
  end
end

end