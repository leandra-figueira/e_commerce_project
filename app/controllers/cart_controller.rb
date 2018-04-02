class CartController < ApplicationController

  def index
    @categories = Category.all
    @cart = Product.find(session[:add_to_cart])
    @products_on_cart = Product.find(session[:add_to_cart])
  end

end
