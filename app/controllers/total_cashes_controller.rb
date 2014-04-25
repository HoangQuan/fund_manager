class TotalCashesController < ApplicationController
  
  def index
    @total_cashes = Admin::TotalCash.order(:updated_at).page(params[:page]).per(5)
  end


  def show
    @total_cash = Admin::TotalCash.find(params[:id])
  end
end
