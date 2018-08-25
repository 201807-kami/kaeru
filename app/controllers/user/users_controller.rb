class User::UsersController < ApplicationController
	
	def top
        @item = Item.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end
	def update
	    @user = User.find(params[:id])
        if @user.update(user_params)
        	flash[:success] = 'Successfully'
        redirect_to user_path
        else
    	render :edit
        end
    end

    def leave
        if current_user.leave
        flash[:success] = '退会しました。　ありがとうございました。'
        redirect_to root_path
        else
        render :leave
        end
    end


end