class RevenuesController < ApplicationController
  
  def index
    @revenues = Admin::Revenue.order(:updated_at).page(params[:page]).per(5)
  end
 

  def show
    @revenue = Admin::Revenue.find(params[:id])
  end
end
