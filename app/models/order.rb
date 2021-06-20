class Order < ApplicationRecord

  has_many :products, through: :order_products

end
