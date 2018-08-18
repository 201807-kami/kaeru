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
    def destroy
    	@user = current_user
    	@user.soft_delete
    	sign_out(@user)
    end

end
