class Order < ApplicationRecord

  has_many :products, through: :order_products
  
  belongs_to :customer

end
