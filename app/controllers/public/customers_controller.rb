class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: '会員情報を更新しました。'
    else
      render :edit
    end
  end

  def withdraw
    customer = current_customer
    customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end


  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
    end

end
