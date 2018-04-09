class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  before_save :price

  def price
    product.price
  end

end
