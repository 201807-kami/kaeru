class User::CartsController < ApplicationController
	 before_action  only: [:create, :update, :delete]

	def create
		@cart = current_cart
		item = item.find(params[:item_id])
		@cart_item = @cart.cart_items.build(item: item)

    	respond_to do |format|
    		#if 	@item.save
    		#flash[:notice] ='success!'
   			#redirect_to user_cart_path(@cart.id)
 	 		#else
    		#flash.now[:notice]='danger'
    		#render user_items_path
      		if @cart_item.save
       			format.html { redirect_to @cart_item.cart, notice: 'カートに商品が追加されました。' }
        		#format.json { render :show, status: :created, location: @line_item }
     	 	#else

        		#format.html { render :new }
        		#format.json { render json: @line_item.errors, status: :unprocessable_entity }
      		end
  	end


  	def show
  		@carts = current_cart
  		@item = item.find(params[:item_id])
		@cart_item = @cart.cart_items.

    	#@cart_item.quantity += params[:quantity].to_i
  	end

  	def update
   	 	@cart_item.update(quantity: params[:quantity].to_i)
    	redirect_to current_cart
  	end

  	def delete
    	@cart_item.destroy
    	redirect_to current_cart
  	end

 private

  	#def setup_cart_item!
   	 	#@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  	#end
 	def cart_params
  		params.require(:cart).permit(:cart_item_id, :user_id)
  	end
  end


end