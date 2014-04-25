class AdminsController < ApplicationController
  layout "admin"
  before_filter :signed_in_user
  before_filter :admin_user
  def index
  end

  def destroy
    @user = Admin::User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
private
  def signed_in_user
    unless signed_in?
      redirect_to root_path, notice: "Please sign in."
    end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path)  unless current_user?(@user)
  end
  def admin_user
    if current_user
      redirect_to(root_path)  unless current_user.admin?
    end
  end
end
