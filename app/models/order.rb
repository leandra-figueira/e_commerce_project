class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :status
  has_many :order_items
  has_many :products, through: :order_items

  before_create :set_status
  before_save :set_subtotal

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
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price) : 0 }.sum
  end

  def total
    subtotal + pst + gst + hst
  end

  private
  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_gst
    self[:gst] = pst
  end

  def set_pst
    self[:pst] = pst
  end

  def set_hst
    self[:hst] = hst
  end

  def set_total
    self[:total] = total
  end

  def set_status
    self.status_id = 1
  end
end
