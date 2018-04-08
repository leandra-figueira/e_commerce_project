class CartController < ApplicationController
  before_action :initialize_variable

  def index
    @categories = Category.order(:name)
    @cart = Product.find(session[:add_to_cart])
    @products_on_cart = Product.find(session[:add_to_cart])

  end

  def reload_quantity
    @quantity = params[:quantity]
    redirect_to cart_index_path
  end




  private
    def initialize_variable
      @quantity = 0
      @total = 0
    end
end
