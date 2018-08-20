class Cart < ApplicationRecord
	 has_many :cart_items, dependent: :destroy
	 belongs_to :user

	    def add_item(item_id)

			current_item = cart_items.find_by_item_id(item_id)

			if current_item
				current_item.increment(:quantity, 1)

			else
				current_item = cart_items.build(item_id: item_id)
			end
			current_item

		end

		def total_price
			cart_items.to_a.sum { |item| item.total_price }
	    end

end
