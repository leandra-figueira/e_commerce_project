class HomeController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
    # @products = Product.search(params[:term], params[:page], params[:category_id])
    @products = Product.order(:name).page(params[:page])
  end

end
