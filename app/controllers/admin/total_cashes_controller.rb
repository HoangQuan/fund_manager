class Admin::TotalCashesController < Admin::AdminController
  layout "admin"
  before_filter :admin_user
  
  def index
    @total_cashes = Admin::TotalCash.order(:updated_at).page(params[:page]).per(5)
  end
  def new
    @total_cash = Admin::TotalCash.new
  end

  def show
    @total_cash = Admin::TotalCash.find(params[:id])
  end

  def create
    @total_cash = Admin::TotalCash.new(params.require(:admin_total_cash).permit(:current_total_cash, :memo))
    @total_cash.attributes = {created_user_id: current_user.id}
    if @total_cash.valid?
      @total_cash.save
      redirect_to admin_total_cash_path(@total_cash), notice: :".created"
    else
      render :new
    end
  end

  def edit
    @total_cash = Admin::TotalCash.find(params[:id])
  end

  def update
    @total_cash = Admin::TotalCash.find(params[:id])
    total_cash = params.require(:admin_total_cash).permit(:current_total_cash, :memo)
    if @total_cash.update(total_cash)
      redirect_to admin_total_cash_path(@total_cash), notice: :".updateted"
    else
      render :edit
    end
  end

  def destroy
    @total_cash = Admin::TotalCash.find(params[:id])
    @total_cash.destroy
    redirect_to admin_total_cashes_path
  end
end
