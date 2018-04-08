class CartController < ApplicationController
  before_action :initialize_variable

  def index
    @categories = Category.order(:name)
    @cart = session[:add_to_cart]
    # @products_on_cart = Product.find(session[:add_to_cart])  // delete after

    # @selected_ids = []
    # @cart.each do |prod|
    #   @selected_ids << prod["id"]
    # end
    # @products_on_cart = Product.find(@selected_ids)

    @cart_array = []

    @cart.each do |prod|
      @prod_details =  Product.find(prod["id"])
      @full_prod_hash = {"id" => @prod_details.id,
                         "name" => @prod_details.name,
                         "description" => @prod_details.description,
                         "price" => @prod_details.price,
                         "quantity" => 1 }

      @cart_array << @full_prod_hash
    end

    session[:add_to_cart] = @cart_array






  end

  def reload_quantity
    @quantity = params[:quantity]
    redirect_to cart_index_path
  end

  def delete_item
    redirect_to cart_index_path
  end


  private
    def initialize_variable
      @quantity = 0
      @total = 0
    end
end
