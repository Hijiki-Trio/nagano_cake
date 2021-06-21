class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  
  def index
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to root_path
  end

  def confirm
  end

  def new
    @order = Order.new
    @addresses = ShippingAddress.where(customer: current_customer)
  end

  def complete
  end
  
  private
  
  def order_params
    params.require(:oreder).permit(:postcode, :address, :name, :shipping, :total_price, :payment, :order_status)
  end
  
end
