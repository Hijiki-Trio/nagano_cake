class Public::ShippingAddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @shipping_addressnew = ShippingAddress.new
    @shipping_addresseses = current_customer.shipping_addresses
  end

  def create
      @shipping_addressnew = ShippingAddress.new(shipping_address_params)
      @shipping_addressnew.customer_id = current_customer.id
    if @shipping_addressnew.save
      redirect_back(fallback_location: root_path)
    else
      @shipping_addresseses = current_customer.shipping_addresses
      render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end


  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path, notice: 'successfully updated!'
    else
      render :edit
    end
  end


  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to shipping_addresses_path
  end


  private
  def shipping_address_params
     params.require(:shipping_address).permit(:postcode, :address, :name)
  end

end

