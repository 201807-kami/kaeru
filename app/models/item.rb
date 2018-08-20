class Item < ApplicationRecord
	attachment :item_image

	has_many :discs
	accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :line_items
	before_destroy :referenced_by_line_item

	has_many :favorites
	has_many :users, through: :favorites
	belongs_to :genres, optional:true
end
