class Customer < ApplicationRecord

  validates :first_name, :last_name, :email, :street, :number, :zipcode, :province_id, :city, presence: true
  validates :first_name, :last_name, length: {minimum: 2}
  validates :email, uniqueness: true
  # found at: https://stackoverflow.com/questions/19353135/what-is-good-way-to-validates-canadian-postal-code-in-rails
  # canadian_postal_code = /[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}/
  # validates :postal_code, format: { with: canadian_postal_code }
  has_many :orders
  belongs_to :province
end
