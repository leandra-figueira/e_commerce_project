class HomeController < ApplicationController
  def index
    @categories = Category.order(:name)
    # @products = Product.all
    @search = Product.ransack(params[:q])

    @products = @search.result.page params[:page]
    @search.build_condition
    # @products = Product.search(params[:term], params[:page], params[:category_id])
    # @products = Product.order(:name).page(params[:page])

  end

end
