class Admin::ItemsController < ApplicationController

	include ItemsHelper
	
	def index
		@search_form = Admin::ItemSearchForm.new(search_params)
	    @search_form.stock_type = :less if @search_form.stock_type.blank?
	    @items = @search_form.search(params[:page])
	    session['search_params'] = view_context.search_conditions_keeper(params, [:genre_id, :title])
	end

	def new
		@item = Item.new
		@item.discs.build
		@item.discs.first.songs.build
	end

	def create
		@item = Item.new(item_params)
		@item.save!
		redirect_to new_admin_item_path
	end

	private

	def search_params
    	return  nil if params[:search].nil?
    	params.require(:search).permit(:genre_id, :title, :stock, :sort_type, :stock_type)
  	end

	def item_params
		params.require(:item).permit(
			:id, :title, :artist_id, :label_id, :genre_id, :price, :stock,
			discs_attributes: [:id, :disc_number, :_destroy,
				songs_attributes: [:id, :name, :_destroy]])
	end
	



end