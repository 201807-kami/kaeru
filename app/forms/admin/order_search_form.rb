class Admin::OrderSearchForm
  include ActiveModel::Model

  attr_accessor :undelivered, :email, :remarks
  attr_reader :orderd_at_from, :orderd_at_to

  def orderd_at_from=(value)
    return if value.blank?
    @orderd_at_from = Date.strptime(value, '%Y-%m-%d')
  end
  def orderd_at_to=(value)
    return if value.blank?
    @orderd_at_to = Date.strptime(value, '%Y-%m-%d')
  end

  def search(page = nil, format: :html)
    orders = Order.includes(:member, details: [:item])
    orders = orders.where(delivered: false) if undelivered.present? && undelivered == '1'
    orders = orders.where(member: [email: email]) if email.present?
    orders = orders.where('`orders`.`orderd_date` >= ?', @orderd_at_from) if orderd_at_from.present?
    orders = orders.where('`orders`.`orderd_date` <= ?', @orderd_at_to) if orderd_at_to.present?
    orders = orders.where('`orders`.`remarks` LIKE ?', "%#{remarks}%") if remarks.present?
    if format == :html
      orders.page(page).per(50).order(id: :desc)
    else
      orders.order(id: :desc)
    end
  end

end