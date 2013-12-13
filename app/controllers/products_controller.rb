class ProductsController < ApplicationController

  def index
    @products = Admin::Product.order(:updated_at).page(params[:page]).per(5)
  end

  def show
    @product = Admin::Product.find(params[:id])
  end

end
