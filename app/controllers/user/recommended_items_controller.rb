class User::RecommendedItemsController < ApplicationController
 layout 'user'
	def index
	  @recommended_items = RecommendedItem.all
	end
end
