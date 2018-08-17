class Admin::UsersController < ApplicationController
  def index
    @search_form = Admin::UserSearchForm.new(search_params)
    @users = @search_form.search(params[:page])
    session[:search_params] = view_context.search_conditions_keeper(params, [:email, :created_at_from, :created_at_to])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.leave
    flash[:success] = '退会処理が完了しました'
    redirect_to admin_users_path(session[:search_params])
  end

  private
  def search_params
    return  nil if params[:search].nil?
    params.require(:search).permit(:email, :created_at_from, :created_at_to)
  end
end