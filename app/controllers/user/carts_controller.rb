class User::CartsController < ApplicationController

  layout 'user'
  before_action :find_cart, only: [:update, :destroy]

  def index
    @carts = current_user.carts
  end

  def create
    Cart.add_item(params[:item_id], current_user)
    redirect_to user_carts_path(current_user)
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to user_carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to action: :index
  end


  private

  def cart_params
      params.require(:cart).permit(:id, :quantity)
  end



  def cart_session_id
    if session[:cart_session_id].blank?
      session[:cart_session_id] = SecureRandom.uuid
    end
    session[:cart_session_id]
  end


end

