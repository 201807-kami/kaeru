class Item < ApplicationRecord
	attachment :item_image

	has_many :discs
	accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :cart_items
	has_many :carts



	has_many :favorites
	has_many :users, through: :favorites
	belongs_to :genre, optional:true
	belongs_to :artist
	belongs_to :label

    def self.search(search) #self.でクラスメソッドとしている
	    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	      Item.where(['title LIKE ?', "%#{search}%"])
	    else
	      Item.all #全て表示。
	    end
    end

  #   def self.top5
  #   ranking = Item.all.sort_by do |item|
  #     item.rank
  #   end

  #   ranking = ranking.keep_if do |item|
  #     item.rank <= 5
  #   end

  #   return ranking
  # end


end