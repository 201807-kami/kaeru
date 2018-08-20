class User::ordersController < ApplicationController
	def new
    @cart = current_cart
      if @cart.cart_items.empty?
        redirect_to user_items_path, notice: 'カートは空です。'
      return
      end

    @order = Order.new

    respond_to do |format|
      format.html
    end
	end

 def create
    @order = Order.new(order_params)
    @order.add_items(current_cart)

    respond_to do |format|
      if @order.save
  Cart.destroy(session[:cart_id])
  session[:cart_id] = nil
        format.html { redirect_to user_order(order.id) , notice: 'ご注文ありがとうございました。' }
        format.html { render :new }
      end
    end
  end


private
  	def order_params
  		params.require(:order).permit(:adress, :payment_method)
 	end