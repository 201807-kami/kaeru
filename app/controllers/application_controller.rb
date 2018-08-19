class ApplicationController < ActionController::Base

	#def after_sign_in_path_for(resource)
		#root_path
	#end

	def after_sign_out_path_for(resource)
		new_user_session_path
	end

<<<<<<< HEAD
end

=======
	def create
		@user = User.new(user_params)
		if @user.save
		redirect_to root_path
		else
		render action: :new
	end
	end
end
>>>>>>> change
