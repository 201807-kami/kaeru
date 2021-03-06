# frozen_string_literal: true

class User::Users::SessionsController < Devise::SessionsController
  layout false
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  #def new
    #if User.where.not(leave_at: nil).exists?
    #session[:keep_signed_in] = false
    #end
  #end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def destroy
    super
    session[:keep_signed_out] = true
  end



  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
