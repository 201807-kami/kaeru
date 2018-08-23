# frozen_string_literal: true

class User::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]

def after_sign_up_path_for(resource)
     user_cart_page_path
end


    # GET /resource/sign_up
  # def new
  #   super
  # private
  #   def cart_params
  #     params.require(:cart).permit(:user_id)
  #   end

end
