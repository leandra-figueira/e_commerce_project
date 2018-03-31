class HomeController < ApplicationController
  def index
    @categories = Category.all
    # @products = Product.all
    @search = Product.ransack(params[:q])

    @products = @search.result.page params[:page]
    @search.build_condition
    # @products = Product.search(params[:term], params[:page], params[:category_id])
    # @products = Product.order(:name).page(params[:page])

    @count_cart_products = session[:count_cart_products]
  end

end
