class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :status
  has_many :order_items
  has_many :products, through: :order_items

  def pst
    (subtotal * customer.province.pst)
  end

  def gst
    (subtotal * customer.province.gst)
  end

  def hst
    (subtotal * customer.province.hst)
  end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    subtotal + pst + gst + hst
  end

end
