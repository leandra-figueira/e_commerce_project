class OrderController < ApplicationController

  before_action :authenticate_customer!

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

  def create_order

    @customer = Customer.find(current_customer.id)
    @province = Province.find(@customer.province_id)

    @subtotal = session[:subtotal].to_f
    @total = @subtotal

    @order = Order.new
    if @province.pst != nil
      @order.pst = @subtotal * @province.pst
      @total += @subtotal * @province.pst
    end
    if @province.hst != nil
      @order.hst = @subtotal * @province.hst
      @total += @subtotal * @province.hst
    end
    if @province.gst != nil
      @order.gst = @subtotal * @province.gst
      @total += @subtotal * @province.gst
    end
    @order.subtotal = @subtotal.to_f
    @order.customer_id = @customer.id
    @order.status_id = 1
    @order.total = @total
    @order.save!

    @orderItems = []
    @array_prods = session[:add_to_cart]

    @array_prods.each do |p|
      # pid =  p["id"].keys[0].to_i
      @oi = OrderItem.new
      @oi.product_id = p["id"]
      @oi.price=p["price"]
      @oi.quantity=p["quantity"]
      @orderItems << @oi
    end
    @order.order_items = @orderItems
    @order.save!

  end

end
