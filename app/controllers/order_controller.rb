class OrderController < ApplicationController

  def new
    # get customer information
    @customer = Customer.find(current_customer.id)
    @province = Province.find(@customer.province_id)

    @full_name = @customer.first_name + " " + @customer.last_name
    if !@customer.suit_number == nil
      @address = @customer.suit_number + " " + @customer.number + " - " + @customer.street
    else
      @address = @customer.number + " - " + @customer.street
    end

    # get products
    @final_produts = session[:add_to_cart]

    # calculate order amount
    @subtotal = session[:subtotal]

    if !@province.hst == nil
      @tax_rate = @province.hst
    else
      @tax_rate = @province.gst + @province.pst
    end

    @taxes = @subtotal.to_f * @tax_rate
    @total = @subtotal.to_f + @taxes
  end

  def create
  end
end
