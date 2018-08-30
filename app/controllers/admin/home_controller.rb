class Admin::HomeController < ApplicationController
  layout 'admin'
  def index
    redirect_to new_admin_session_path and return unless admin_signed_in?
    @undelivered_counts = Order.where(status: "受付中").count
    @selling_item_counts = Item.where(status: "販売中").count
    @user_counts = User.where(leave_at: nil).count
    @current_month_order_summary = Order.select('SUM(item_amount) AS amount').where('ordered_date >= ?', Date.current.beginning_of_month).first.amount
    @limit_stock_items = Item.where(status: "販売中").where('`stock` <= 5').order(:stock).limit(5)
    render 'admin/home'
  end
end