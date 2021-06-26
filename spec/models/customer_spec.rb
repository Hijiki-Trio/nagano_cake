require 'rails_helper'

RSpec.describe Customer, type: :model 

  
describe '有効なカスタマー' do
    it '全ての項目が入力されていれば有効' do
      customer = Customer.new(
        first_name: "ホゲホゲ",
        last_name: "ホゲホゲ",
        first_name_kana: "ホゲホゲ",
        last_name_kana: "ホゲホゲ",
        email: "hogehoge@hoge",
        postcode: "00000000",
        address: "ホゲホゲ",
        phone_number: "00000000",
        password: "hogehoge",
        password_confirmation: "hogehoge",
      )
      expect(customer).to be_valid
    end

 describe '無効なカスタマー' do
    it '苗字がなければ無効' do
      customer = Customer.new(first_name: nil)
      customer.valid?
      expect(customer.errors[:first_name]).to include('を入力してください')
    end

    it '名前がなければ無効' do
      customer = Customer.new(last_name: nil)
      customer.valid?
      expect(customer.errors[:last_name]).to include('を入力してください')
    end
    
    it 'カナ入力されてなければ無効' do
      customer = Customer.new(first_name_kana: nil)
      customer.valid?
      expect(customer.errors[:first_name_kana]).to include('を入力してください')
    end    
    
    it 'セイがなければ無効' do
      customer = Customer.new(last_name_kana: nil)
      customer.valid?
      expect(customer.errors[:last_name_kana]).to include('を入力してください')
    end  
    
    it 'メールアドレスがなければ無効' do
      customer = Customer.new(email: nil)
      customer.valid?
      expect(customer.errors[:email]).to include('を入力してください')
    end
    
    it '郵便番号が入力されていなければ無効' do
      customer = Customer.new(postcode: nil)
      customer.valid?
      expect(customer.errors[:postcode]).to include('を入力してください')
    end
    
     it '電話番号が入力されていなければ無効' do
      customer = Customer.new(phone_number: nil)
      customer.valid?
      expect(customer.errors[:phone_number]).to include('を入力してください')
    end
    
     it 'パスワードが入力されていなければ無効' do
      customer = Customer.new(password: nil)
      customer.valid?
      expect(customer.errors[:password]).to include('を入力してください')
    end
  end
end

