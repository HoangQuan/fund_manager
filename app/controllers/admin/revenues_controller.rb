class Admin::RevenuesController < Admin::AdminController
  layout "admin"
  before_filter :admin_user
  
  def index
    @revenues = Admin::Revenue.order(:updated_at).page(params[:page]).per(5)
  end
  def new
    @revenue = Admin::Revenue.new
  end

  def show
    @revenue = Admin::Revenue.find(params[:id])
  end

  def create
    @revenue = Admin::Revenue.new(params.require(:admin_revenue).permit(:name, :amount, :content))
    if @revenue.valid?
      @revenue.save
      @revenue.update_user_balance
      @revenue.create_user_revences
      redirect_to admin_revenue_path(@revenue), notice: :".created"
    else
      render :new
    end
  end

  def edit
    @revenue = Admin::Revenue.find(params[:id])
  end

  def update
    @revenue = Admin::Revenue.find(params[:id])
    revenue = params.require(:admin_revenue).permit(:name, :amount, :content)
    if @revenue.update(revenue)
      redirect_to admin_revenue_path(@revenue), notice: :".updateted"
    else
      render :edit
    end
  end

  def destroy
    @revenue = Admin::Revenue.find(params[:id])
    @revenue.destroy
    redirect_to admin_revenues_path
  end
end
