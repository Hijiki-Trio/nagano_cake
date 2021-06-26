class ShippingAddress < ApplicationRecord
  belongs_to :customer
  
  validates :name, :postcode, :address, presence: true

end
