class Admin::OrderSearchForm
  include ActiveModel::Model

  attr_accessor :undelivered, :email, :remarks
  attr_reader :ordered_at_from, :ordered_at_to

  def ordered_at_from=(value)
    return if value.blank?
    @ordered_at_from = Date.strptime(value, '%Y-%m-%d')
  end
  def ordered_at_to=(value)
    return if value.blank?
    @ordered_at_to = Date.strptime(value, '%Y-%m-%d')
  end

  def search(page = nil)
    orders = Order.includes(:user, order_items: [:item])
    orders = orders.where(user: [email: email]) if email.present?
    orders = orders.where('`orders`.`ordered_date` >= ?', @ordered_at_from) if ordered_at_from.present?
    orders = orders.where('`orders`.`ordered_date` <= ?', @ordered_at_to) if ordered_at_to.present?
    
    orders.page(page).per(50).order(id: :desc)
    
  end

end