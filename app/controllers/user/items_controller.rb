class User::ItemsController < ApplicationController
	layout 'user'


	# def top5
 #    # @ideas = Idea.top5
 #    @items = Item.all

 #    respond_to do |format|
 #      format.top.html # top5.html.erb
 #      format.json { render json: @items }
 #    end
 #  end

 #    def rank
 #    ranking = Item.all.collect do |item|
 #      item.orders.count
 #    end

 #    self_orders_count = self.orders.count

 #    high_rank_items = ranking.keep_if do |orders_count|
 #      orders_count > self_orders_count
 #    end

 #    return high_rank_items.count + 1
 #  end


# 	def rank
#       @rank = Item.find(Item.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))
# 　  end

	def index
      @items = Item.search(params[:search])
	end
	def show
	  @item = Item.find(params[:id])
	  @disc = Disc.find(params[:id])
	  @song = Song.find(params[:id])
	end

	private

	def item_params
  		params.require(:item).permit(:cart_id, :item_image_id, :artist_id, :label_id, :genre_id, :price, :stock, :sales_quantity, :release_date,
       :title)
  	end
end
