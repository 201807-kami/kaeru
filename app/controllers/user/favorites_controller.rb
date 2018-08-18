class User::FavoritesController < ApplicationController

 def create

    @user_id = current_user.id
    @item_id = item.find(params[:id]).id
    @favorites = Favorites.new(item_id: @item_id, user_id: @user_id)

      if @item.save
        redirect_to user_path(current_user)
      end


 end


  def destroy
    @favorites = Favorites.find(params[:id])
    if @item.destroy
      redirect_to user_path(current_user)
    end
  end

end