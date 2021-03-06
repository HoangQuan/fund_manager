class SpendingsController < ApplicationController
  before_filter :signed_in_user
  def index
    @spendings = Admin::Spending.order(:updated_at).page(params[:page]).per(5)
  end
  
  def show
    @spending = Admin::Spending.find(params[:id])
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
