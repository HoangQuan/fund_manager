class SpendingsController < ApplicationController
  
  def index
    @spendings = Admin::Spending.order(:updated_at).page(params[:page]).per(5)
  end
  
  def show
    @spending = Admin::Spending.find(params[:id])
  end
end
