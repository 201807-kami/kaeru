class User::CartsController < ApplicationController
  
  before_action :find_cart, only: [:update, :destroy]

  def index
    @carts = current_user.carts

    @price = 0

    @carts.each do |carts|
    @price += carts.item.price * carts.quantity
      end
  end

  def create
    Cart.add_item(params[:item_id], current_user)
    redirect_to user_carts_path(current_user)
  end

  def update_item
    @carts = current_user.carts
    update_item = 0
    @cart.update_item(quantity: params[:quantity].to_i)
    redirect_to user_carts_path(current_user)
  end

  def update
    @carts = current_user.carts
    @carts.update
    redirect_to new_user_order_path
  end

  def destroy
    @cart.destroy!
    redirect_to action: :index
  end

  private


  def cart_session_id
    if session[:cart_session_id].blank?
      session[:cart_session_id] = SecureRandom.uuid
    end
    session[:cart_session_id]
  end

  def find_cart
    if user_signed_in?
      @cart = current_user.carts.find(params[:cart_id])
    else
      @cart = Cart.find_by(user: nil, session_id: cart_session_id)
      raise ActiveRecord::RecordNotFound if @cart.nil?
    end
  end
end