class ProductsController < ApplicationController
  # GET /products
  def index
    @categories = Category.all
    @search = Product.ransack(params[:q])
    @products = @search.result.page params[:page]
    @search.build_condition
  end

  # GET /products/:id
  def show
    @categories = Category.all
    @product = Product.find(params[:id])
  end
end
