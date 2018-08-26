class Admin::OrdersController < ApplicationController
	layout 'admin'

	def index
    @search_form = Admin::OrderSearchForm.new(search_params)
    session[:search_params] = view_context.search_conditions_keeper(params, [:delivered, :email, :orderd_at_from, :orderd_at_to, :remarks])
  end

  def show
    @order = Order.includes(:details).find(params[:id])
    @before_order = Order.where('id < ?', @order.id).order(id: :desc).first
    @next_order = Order.where('id > ?', @order.id).order(:id).first
  end

  def update
    @order = Order.find(params[:id])
    @order.assign_attributes(post_params)
    if @order.save
      flash[:success] = '登録が完了しました'
      redirect_to admin_order_path(@order)
    else
      flash.now[:error] = '入力内容をご確認ください'
      render :show
    end
  end

  private
  def search_params
    return  nil if params[:search].nil?
    params.require(:search).permit(:undelivered, :email, :orderd_at_from, :orderd_at_to, :remarks)
  end

  def post_params
    params.require(:order).permit(:remarks, :delivered, :delivered_at)
  end
end