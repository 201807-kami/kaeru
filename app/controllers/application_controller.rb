class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters, only: [:update]

	#def after_sign_in_path_for(resource)
		#root_path
	#end

	def after_sign_out_path_for(resource)
		new_user_session_path
	end

	def create
		@user = User.new(user_params)
		if @user.save
		redirect_to :root_path
		else
		render action: :new
	end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :tel])
      u.permit(:first_name, :last_name, :tel, :password, :password_confirmation, :current_password)
  end
end

end
