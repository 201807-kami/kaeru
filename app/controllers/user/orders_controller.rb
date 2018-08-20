class User::ordersController < ApplicationController
	def show
	end

	def purchase_complete
		@order = order.find(params[:id])
	if @order.save
    	flash[:notice] ='ご注文ありがとうございます'
    	redirect_to
    else
    	redirect_to 
  else
   	 	flash.now[:notice]='danger'
   		render
 	end
	end

private
  	def order_params
  		params.require(:order).permit(:cart_id)
 	end