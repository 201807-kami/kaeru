class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
	#def after_sign_in_path_for(resource)
		#root_path
	#end

	def after_sign_out_path_for(resource)
		new_user_session_path
	end

	 # Prevent CSRF attacks by raising an exception.
     # For APIs, you may want to use :null_session instead.
  		protect_from_forgery with: :exception

	private
		def current_cart

		Cart.find(session[:cart_id])

		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
    end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :tel, :first_name_furigana, :last_name_furigana, :zip, :address, :email])
  end

end
