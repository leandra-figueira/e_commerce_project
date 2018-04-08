class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart

  def index
    @categories = Category.order(:name)
    @search = Product.ransack(params[:q])
    @products = @search.result.page params[:page]
    @search.build_condition

  end

  # GET /products/:id
  def show
    @categories = Category.order(:name)
    @product = Product.find(params[:id])
  end

  def add_to_cart

    id = params[:id].to_i

    prod_found = false
    session[:add_to_cart].each do |product|
      if product["id"] == id
        prod_found = true
      end
    end

    if prod_found
      @error_alert = "Product already added to your cart."
    else
      selectedProduct = {"id" => id, "quantity" => 1 }
      session[:add_to_cart] << selectedProduct
      @success_alert = "You sucessfully added the product to your shopping cart."
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
    # session[:quantity] = 0
    # qnty = 0
  end

  def load_shopping_cart
    # @products_on_cart = Product.find(session[:add_to_cart])
    # render "/cart/index"
  end
end
