class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    # カート機能

  def current_cart
    # 既にあるカートに商品を追加する時
    if session[:cart_product_id]
      @cart_product = CartProduct.find(session[:cart_product_id])
    # 初めてカートに追加する時
    else
      @cart_product = CartProduct.create!
      session[:cart_product_id] = @cart_product.id
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postcode,
      :address,
      :phone_number
    ])
  end



end
