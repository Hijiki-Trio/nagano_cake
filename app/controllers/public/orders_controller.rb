class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  
  def index
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id #カスタマー情報追加
    @order.save
    @cart_products = current_customer.cart_product.all #注文履歴
     @cart_products.each do |cart_product|
       @order_products = @order.order_products.new
       @order_products.product_id = cart_product.product.id
       @order_products.quantity = cart_product.quantity
       @order_products.price = cart.price
       current_customer.cart_product.destroy_all
      end
    redirect_to orders_conplete_parh
  end

  def confirm #注文確認画面
    @order = Order.new(order_params)
    @cart_products = current_customer.cart_products
    @order.payment = params[:order][:payment]
    if params[:order][:address_option] == "0" #自身の住所
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      
    elsif params[:order][:address_option] == "1"  #登録済住所
      @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id]) 
      @order.postcode = @shipping_address.postcode
      @order.address = @shipping_address.address
      @order.name = @shipping_address.name
      
    elsif params[:order][:address_option] == "2"  #新しい届け先
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address] 
      @order.name = params[:order][:name] 
    end
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def complete
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :shipping, :total_price, :payment, :order_status, :customer_id)
  end
end
