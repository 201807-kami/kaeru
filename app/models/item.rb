class Item < ApplicationRecord
	attachment :item_image
	validates :item_image, presence: true

	has_many :discs
	accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :cart_items
	before_destroy :referenced_by_cart_item

	private
	def referenced_by_cart_item

		if cart_items.empty?
			return true
		else
			errors.add(:base, '品目が存在します。')
			retuen false
		end
	end

	has_many :favorites
	has_many :users, through: :favorites
	belongs_to :genres, optional:true

end