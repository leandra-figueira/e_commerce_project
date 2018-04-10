class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  before_save :set_unit_price

  def price
    if persisted?
      self[:price]
    else
      product.price
    end
  end

  # def quantity
  #   # session[:add_to_cart]['quantity']
  # end

  private
  # def product_present
  #   if product.nil?
  #     errors.add(:product, "is not valid or is not active.")
  #   end
  # end
  #
  # def order_present
  #   if order.nil?
  #     errors.add(:order, "is not a valid order.")
  #   end
  # end

  def set_unit_price
    self[:price] = price
  end
end
