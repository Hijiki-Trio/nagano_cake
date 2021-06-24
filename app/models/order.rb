class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_products
  has_many :products, through: :order_products

    enum payment:{
    "クレジットカード":0,
    "銀行振込":1
  }

  enum order_status:{入金待ち:0, 入金確認:1,  製作中:2, 発送準備中:3, 発送済み:4}


  def tax_included
  	(price*1.10).round
  end

  def order_product_status_auto_update
    if self.order_status == "入金確認"
      self.order_products.each do |order_product|
        order_product.update_attributes(product_status: "製作待ち")
      end
    elsif self.order_status == "入金待ち"
      self.order_products.each do |order_product|
        order_product.update_attributes(product_status: "着手不可")
      end
    end
  end


end
