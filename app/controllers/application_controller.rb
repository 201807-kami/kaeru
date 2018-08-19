class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		root_path
	end

	def after_sign_out_path_for(resource)
		new_user_session_path
	end

	protect_from_forgery with: :exception


    helper_method :current_cart

  	def current_cart
    	if session[:cart_id]
      		@cart = Cart.find(session[:cart_id])
    	else
      		@cart = Cart.create
      		session[:cart_id] = @cart.id
    	end
  	end
end
