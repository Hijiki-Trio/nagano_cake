require 'rails_helper'

RSpec.feature "管理機能", type: :feature do
  feature "会員登録" do
    background do
      @customer = FactoryBot.create(:customer)
  end
  
  scenario '会員情報を編集することができる' do
        # sign_in @customer
        visit customer_path(@customer)
        find(".text-dark").click_on
        
            #全項目変更
        fill_in "customer_first_name",     with: "変更"
        fill_in "customer_last_name",      with: "健太"
        fill_in "customer_first_name_kana",     with: "ヘンコウ"
        fill_in "customer_last_name_kana",      with: "ケンタ"
        fill_in "customer_email",          with: "change@email.com"
        fill_in "customer_postcode",       with: "12345678"
        fill_in "customer_address",        with: "変更町"
        fill_in "customer_phone_number",   with: "123456789"
        click_on '編集内容を保存する'
        
        #変更内容が保存されている
        expect(current_path).to eq customer_path(@customer)
        expect(page).to have_content '変更'
        expect(page).to have_content '健太'
        expect(page).to have_content 'ヘンコウ'
        expect(page).to have_content 'ケンタ'
        expect(page).to have_content 'change@email.com'
        expect(page).to have_content '12345678'
        expect(page).to have_content '変更町'
        expect(page).to have_content '123456789'  
    end
  end
end