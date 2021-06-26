require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
  end
  
  it '全ての項目に正しい情報を入力している' do
      customer = @customer
      shipping_address = ShippingAddress.new(
        name: "佐藤二朗",
        postcode: "0000000",
        address: "東京都渋谷区",
        customer_id: 1,
      )
      expect(shipping_address).to be_valid
    end
  end
  
  describe '無効な配送先' do
    it '名前を入力していない' do
      customer = @cutomer
      shipping_address = ShippingAddress.new(name: nil)
      shipping_address.valid?
      expect(shipping_address.errors[:name]).to include('を入力してください')
    end
    
    it '郵便番号を入力していない' do
      customer = @customer
      shipping_address = ShippingAddress.new(postcode: nil)
      shipping_address.valid?
      expect(shipping_address.errors[:postcode]).to include('を入力してください')
    end
    
    it '住所を入力していない' do
      customer = @customer
      shipping_address = ShippingAddress.new(address: nil)
      shipping_address.valid?
      expect(shipping_address.errors[:address]).to include('を入力してください')
    end
  end