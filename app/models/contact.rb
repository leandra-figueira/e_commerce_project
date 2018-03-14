class Contact < ApplicationRecord
  validates :description, presence: true
end
