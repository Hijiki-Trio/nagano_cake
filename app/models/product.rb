class Product < ApplicationRecord
  attachment :image

  belongs_to :genre

  has_many :orders, through: :order_products
  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy

  validates :genre_id, :name, :detail, :price, :image, presence: true

  def tax_included
  	(price*1.10).round
  end
end