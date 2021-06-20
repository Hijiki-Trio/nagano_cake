class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  def current_cart
    current_cart = CartProduct.find_by(id: session[:cart_product_id])
    current_cart = CartProduct.create unless current_cart
    session[:cart_product_id] = current_cart.id
    current_cart
  end

end
