class CartController < ApplicationController
  before_action :initialize_variable

  def index
    @categories = Category.order(:name)
    @cart = session[:add_to_cart]
    @cart_array = []

    @subtotal = 0
    @cart.each do |prod|
      @prod_details =  Product.find(prod["id"])
      @full_prod_hash = {"id" => prod["id"],
                         "name" => @prod_details.name,
                         "description" => @prod_details.description,
                         "price" => @prod_details.price,
                         "quantity" => prod["quantity"],
                         "total" => @prod_details.price * prod["quantity"].to_i}

      @cart_array << @full_prod_hash

      @subtotal += @full_prod_hash["total"]
      session[:subtotal] = @subtotal
    end

    session[:add_to_cart] = @cart_array





  end

  def reload_quantity
    quantity = params[:quantity]
    selectedH = params[:selectedId]
    selectedId = params[:selectedId].keys[0].to_i
    array_products = session[:add_to_cart]
    array_products.each do |prod|
      if prod["id"] == selectedId
        prod["quantity"] = quantity
      end
    end
    session[:add_to_cart] = array_products
    redirect_to cart_index_path
  end

  def delete_item
    selected_index = params[:selectedIndex].keys[0].to_i
    array_products = session[:add_to_cart]
    array_products.delete_at(selected_index)
    session[:add_to_cart] = array_products
    redirect_to cart_index_path
  end


  private
    def initialize_variable
      @quantity = 0
      @total = 0
      session[:subtotal] ||= 0
    end
end
