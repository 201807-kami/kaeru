class Admin::ItemsController < ApplicationController
	# protect_from_forgery except: :update
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
		if @item.save
			redirect_to admin_items_path
		else
			@item.discs.build
			@item.discs.first.songs.build
			render :new
		end
	end

	def edit 
		@item = Item.find(params[:id])
	end

	def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path(session['search_params'])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = '削除が完了しました'
    redirect_to admin_items_path(session['search_params'])
  end


	private

	def search_params
    	return  nil if params[:search].nil?
    	params.require(:search).permit(:genre_id, :title, :stock, :sort_type, :stock_type, statuses: [])
  	end

	def item_params
		params.require(:item).permit(
			:id, :title, :item_image,:image, :artist_id, :label_id, :genre_id, :price, :stock, :status, :recommended,
			discs_attributes: [:id, :disc_number, :_destroy,
				songs_attributes: [:id, :name, :_destroy]])
	end
	



end