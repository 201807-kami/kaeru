class Item < ApplicationRecord
	has_many :discs
	accepts_nested_attributes_for :discs, allow_destroy: true
	has_many :favorites
	has_many :users, through: :favorites
	belongs_to :genres, optional:true
end
