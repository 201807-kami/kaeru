class User::FavoritesController < ApplicationController
  layout 'user'
	def index
		if user_signed_in?
	    @user = current_user
	    @favorite = Favorite.where(user_id: @user.id).all
	    else
	    redirect_to new_user_session_path
	    end
	end


	#お気に入り登録用アクション
	def create
	    @item_id = Item.find(params[:id]).id #特定のitemのid
	    #item_idに@item_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
	    if user_signed_in?
	    @favorite = Favorite.new(item_id: @item_id, user_id: current_user.id)
	    @favorite.save
	      #保存に成功した場合、一覧画面に戻る
	    redirect_to user_favorites_path
	    else
	    redirect_to new_user_session_path
	    end
    end

    #お気に入り削除用アクション
    def destroy
        favorite = Favorite.find(params[:id])
	    favorite.destroy
	    redirect_to root_path
    end


end