class HomeController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
    # @products = Product.search(params[:term], params[:page], params[:category_id])
  end
end
