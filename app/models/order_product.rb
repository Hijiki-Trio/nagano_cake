class OrderProduct < ApplicationRecord

  belongs_to :product
  belongs_to :order
  
  enum product_status: {着手不可:0, 製作待ち:1, 製作中:2, 製作完了:3}
  
  def order_status_auto_update
    if self.product_status == "製作中"
      self.order.update_attributes(order_status: "製作中")
    end
  end

  def product_auto_update
    order_products = self.order.order_products
    product_status = order_products.pluck(:product_status)
     if product_status.all?{ |product_status| product_status == "製作完了"}
       self.order.update_attributes(order_status: "発送準備中")
     end
  end

end
