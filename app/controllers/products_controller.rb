class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart

  def index
    @categories = Category.order(:name)
    @search = Product.ransack(params[:q])
    @products = @search.result.page params[:page]
    @search.build_condition

    # session[:count_cart_products] ||= 0
    # session[:count_cart_products] += 1
  end

  # GET /products/:id
  def show
    @categories = Category.order(:name)
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    qnty = params[:Quantity]

    unless (session[:add_to_cart].include?(id)) && (qnty > 0)
      session[:add_to_cart] << id
      session[:quantity] = qnty
      @success_alert = "You sucessfully added the product to your shopping cart."
    else
      @error_alert = "Product already added to your cart."
    end


  end
  # Automatically load the view: add_to_cart.js.erb

  def remove_from_cart
    id = params[:id].to_i
    session[:add_to_cart].delete(id)
  end

  def clear_cart
    session[:add_to_cart] = []
  end

  private
  def initialize_session
    session[:add_to_cart] ||= []
    session[:quantity] = 0
    qnty = 0
  end

  def load_shopping_cart
    # @products_on_cart = Product.find(session[:add_to_cart])
    # render "/cart/index"
  end
end
