class Admin::UserRevenuesController < Admin::AdminController
  layout "admin"
  before_filter :admin_user
  
  def index
    @q = Admin::UserRevenue.all.search params[:q]
    @user_revenues = @q.result.page(params[:page]).per(15)
  end
  def new
    @user_revenue = Admin::Revenue.new
  end

  def show
    @user_revenue = Admin::Revenue.find(params[:id])
  end

  def create
    @user_revenue = Admin::Revenue.new(params.require(:admin_revenue).permit(:name, :amount, :content))
    if @user_revenue.valid?
      @user_revenue.save
      redirect_to admin_user_revenue_path(@user_revenue), notice: :".created"
    else
      render :new
    end
  end

  def edit
    @user_revenue = Admin::Revenue.find(params[:id])
  end

  def update
    @user_revenue = Admin::UserRevenue.find(params[:id])
    user_revenue = params.require(:admin_user_revenue).permit(:status)
    if @user_revenue.update(user_revenue)
      redirect_to admin_user_revenues_path, notice: :".updateted"
    else
      render :edit
    end
  end

  def destroy
    @user_revenue = Admin::Revenue.find(params[:id])
    @user_revenue.destroy
    redirect_to admin_user_revenues_path
  end
end
