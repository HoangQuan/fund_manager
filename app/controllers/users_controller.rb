class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end
  def index
    @q = User.order_by_updated.search params[:q]
    @users = @q.result.page(params[:page]).per(15)
  end

end
