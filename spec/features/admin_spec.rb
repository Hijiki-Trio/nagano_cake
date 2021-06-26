require 'rails_helper'

RSpec.feature "管理者 マスタ登録", type: :feature do
  before do
    @admin = FactoryBot.create(:admin)
    FactoryBot.create(:product)
  end
  
  context 'ログイン画面' do
    it 'ログイン画面が表示されること' do
      visit new_admin_session_path
      expect(page).to have_content('メールアドレス')
      expect(page).to have_content('パスワード')
    end
  end
  
  context 'フォームの入力値が正常' do
    it 'ログインに成功' do
      visit new_admin_session_path
      fill_in 'admin_email', with: @admin.email
      fill_in 'admin_password', with: @admin.password
      click_button "ログイン"
      expect(page)
    end
  
     it "ログイン後注文履歴一覧に遷移" do
      visit new_admin_session_path
      fill_in 'admin_email', with: @admin.email
      fill_in 'admin_password', with: @admin.password
      click_button "ログイン"
      expect(current_path).to eq admin_orders_path
    end
  end
  
  context 'メールアドレスが未入力' do
    it 'ログインに失敗' do
      visit new_admin_session_path
      fill_in 'admin_email', with: ''
      fill_in 'admin_password', with: @admin.password
      click_button "ログイン"
      expect(page).to have_content('Email もしくはパスワードが不正です。')
    end
  end
  
  context 'パスワードが未入力' do
    it 'ログインに失敗' do
      visit new_admin_session_path
      fill_in 'admin_email', with: @admin.email
      fill_in 'admin_password', with: ''
      click_button "ログイン"
      expect(page).to have_content('Email もしくはパスワードが不正です。')
    end
  end
  
  describe 'ログイン後' do
    before do
      visit new_admin_session_path
      fill_in 'admin_email', with: @admin.email
      fill_in 'admin_password', with: @admin.password
      click_button "ログイン"
      Genre.create(id:1, name: 'ケーキ')
      @product = Product.create(id: 1,name: 'アンパン', genre_id: 1, price: 500, detail: 'うまい', is_active: true)
    end
  end
end
