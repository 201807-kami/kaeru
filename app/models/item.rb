class Item < ApplicationRecord
	attachment :item_image

	has_many :discs
	accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :cart_items
	before_destroy :referenced_by_cart_item


	has_many :favorites
	has_many :users, through: :favorites
	belongs_to :genre, optional:true
	belongs_to :artist

end