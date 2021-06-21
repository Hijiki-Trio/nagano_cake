class Product < ApplicationRecord
  attachment :image

  belongs_to :genre
  has_many :orders, through: :order_products
  has_many :cart_products, dependent: :destroy

  
  def tax_included
  	(price*1.10).round
  end
  
end
