class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def update #製作ステータスの更新
		@order_product = OrderProduct.find(params[:id])
		@order = @order_product.order
		if @order.order_status != "入金待ち"
  		@order_product.update(order_product_params)
  		@order_product.order_status_auto_update
  		@order_product.product_auto_update
  		redirect_to admin_order_path(@order)
		else
		  redirect_to admin_order_path(@order)
		end
  end
  
  
 private
  def order_product_params
     params.require(:order_product).permit(:product_status)
  end
end