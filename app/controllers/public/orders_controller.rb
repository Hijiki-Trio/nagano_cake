class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id #カスタマー情報追加
    @order.save
    @cart_products = current_customer.cart_products.all #注文履歴
     @cart_products.each do |cart_product|
      OrderProduct.create(product_id: cart_product.product.id, quantity: cart_product.quantity, price: cart_product.product.price, order_id: @order.id)
     end
    current_customer.cart_products.destroy_all
    redirect_to orders_complete_path
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
