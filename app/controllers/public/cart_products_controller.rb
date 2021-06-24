class Public::CartProductsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products
  end

  def create
    @cart_product = current_customer.cart_products.new(cart_product_params)
    @cart_product.product_id

    # カートに既に同じ商品が入っていたら数量を変更、そうでなければ新しく追加
    if current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]).present?
      @cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
      @cart_product.quantity += params[:cart_product][:quantity].to_i
      @cart_product.save
      redirect_to cart_products_path
    else
      if @cart_product.quantity == nil
        redirect_to request.referer, error: "個数を選択してください"
      else
       @cart_product.save
       redirect_to cart_products_path
      end
    end
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(quantity: params[:cart_product][:quantity].to_i)
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    redirect_to cart_products_path
  end

  private

    def cart_product_params
      params.require(:cart_product).permit(:quantity, :product_id)
    end

end
