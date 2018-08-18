class User::FavoritesController < ApplicationController

	def show
	    @user = User.find(params[:id])
	    #特定のユーザーが登録したお気に入りを全て取得する
	    @favorites = Favorite.where("user_id = ?", @user)
    end

  #お気に入り登録用アクション
  def create
    @user_id = session[:id] #ログインしたユーザのID
    @item_id = Item.find(params[:id]).id #特定のitemのid
    #item_idに@item_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
    @favorite = Favorite.new(item_id: @item_id, user_id: @user_id)
    if @favorite.save
      #保存に成功した場合、本一覧画面に戻る
      redirect_to user_items_path
    end
end

  #お気に入り削除用アクション
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      redirect_to user_path(session[:id])
  end
end

end