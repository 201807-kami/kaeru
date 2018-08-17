class Admin::ItemsController < ApplicationController

	include ItemsHelper
	
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
		@item.discs.build
		@item.discs.first.songs.build
	end

	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to new_admin_item_path
	end

	private

	def item_params
		params.require(:item).permit(
			:id, :title,
			discs_attributes: [:id, :disc_number, :_destroy,
				songs_attributes: [:id, :name, :_destroy]])
	end
	



end