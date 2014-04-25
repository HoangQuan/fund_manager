class Admin::SpendingsController < Admin::AdminController
  layout "admin"
  before_filter :admin_user
  
  def index
    @spendings = Admin::Spending.order(:updated_at).page(params[:page]).per(5)
  end
  def new
    @spending = Admin::Spending.new
  end

  def show
    @spending = Admin::Spending.find(params[:id])
  end

  def create
    @spending = Admin::Spending.new(params.require(:admin_spending).permit(:name, :amount, :content))
    @spending.attributes = {created_user_id: current_user.id}
    if @spending.valid?
      @spending.save
      @spending.create_total_cash
      redirect_to admin_spending_path(@spending), notice: :".created"
    else
      render :new
    end
  end

  def edit
    @spending = Admin::Spending.find(params[:id])
  end

  def update
    @spending = Admin::Spending.find(params[:id])
    spending = params.require(:admin_spending).permit(:name, :amount, :content)
    if @spending.update(spending)
      redirect_to admin_spending_path(@spending), notice: :".updateted"
    else
      render :edit
    end
  end

  def destroy
    @spending = Admin::Revenue.find(params[:id])
    @spending.destroy
    redirect_to admin_spendings_path
  end
end
