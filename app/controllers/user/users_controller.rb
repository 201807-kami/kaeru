class User::UsersController < ApplicationController
	
	def top
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end
	def update
	    @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end

    def leave
        current_user.leave
        redirect_to root_path
    end


end