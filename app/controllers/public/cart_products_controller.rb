class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def create
    cart_product = current_customer.cart_products.build(cart_product_params)
    cart_product.save
    redirect_to cart_products_path
  end

  def update
  end

  def destroy
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
  end

  private

    def cart_product_params
      params.require(:cart_product).permit(:quantity)
    end

end
