class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    if params[:customer_id].nil? #indexページでは個別の注文履歴も表示させるための条件分岐
     @orders = Order.page(params[:page]).reverse_order
    else
     @orders = Order.where(customer_id: params[:customer_id]).page(params[:page]).reverse_order
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end
  
  def update #注文ステータス
    order = Order.find(params[:id])
    order.update(order_params)
    order.order_product_status_auto_update
    redirect_back(fallback_location: root_path)
  end
  
 private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
