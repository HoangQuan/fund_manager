class Admin::UsersController < Admin::AdminController
  layout "admin"
  before_filter :admin_user

  def index
    @users = User.order(:created_at).page(params[:page]).per(15)
  end
  def new
    @user = Admin::User.new
  end

  def show
    @user = Admin::User.find(params[:id])
  end

  def create
    @user = Admin::User.new(params.require(:admin_user).permit(:name, :admin))
    if @user.valid?
      @user.save
      redirect_to admin_user_path(@user), notice: :".created"
    else
      render :new
    end
  end

  def edit
    @user = Admin::User.find(params[:id])
  end

  def update
    @user = Admin::User.find(params[:id])
    user = params.require(:admin_user).permit(:name, :admin)
    if params[:charge]
      @user.balance = @user.balance + params[:admin_user][:balance].to_i
    end
    if @user.update(user)
      @user.create_total_cash(params[:admin_user][:balance].to_i)
      redirect_to admin_users_path(), notice: :".updateted"
    else
      render :edit
    end
  end

  def destroy
    @user = Admin::User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
end
