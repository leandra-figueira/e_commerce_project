class Customer < ApplicationRecord
  belongs_to :province
  validates :first_name, :last_name, :email, :street, :number, :zipcode, :city, presence: true
  validates :email, uniqueness: true
end
