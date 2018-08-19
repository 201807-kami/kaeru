class Admin::ItemSearchForm
  include ActiveModel::Model

  attr_accessor :genre_id, :title, :stock, :sort_type, :stock_type

  def search(page)
    items = Item.all
    #items = Item.includes(:caption_image)
    items = items.where('`items`.`title` like ?', "%#{title}%") if title.present?
    if stock.present?
      symbol = stock_type == 'less' ? '<=' : '>='
      items = items.where("`items`.`stock` #{symbol} ?", stock)
    end
    #items = items.where(status: statuses) if statuses.present?

    #items = items.page(page).per(50)
    case sort_type
      when 'asc'
        items = items.order(:id)
      when 'stock_desc'
        items = items.order(stock: :desc, id: :desc)
      when 'stock_asc'
        items = items.order(stock: :asc, id: :desc)
      else
        items = items.order(id: :desc)
    end
    items
  end

end