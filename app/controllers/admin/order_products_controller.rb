class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def update #製作ステータスの更新
		@order_product = OrderProduct.find(params[:id])
		@order = @order_product.order
		@order_product.update(order_product_params)
		redirect_to admin_order_path(@order)
  end
  
  
private
  def order_product_params
     params.require(:order_product).permit(:product_status)
  end
end