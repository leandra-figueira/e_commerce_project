class CategoriesController < ApplicationController
  def index
  end

  def show
    @categories = Category.all
    @products = Category.find(params[:id]).products.order(:name).page(params[:category_id])
    # @products = Category.find(params[:id]), page(params[:page], params[:category_id])
    # @products = Product.order(:name).page(params[:term])
    # @products = Product.search(params[:term], params[:page], params[:category_id])
  end
end
