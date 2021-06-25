require 'rails_helper'

RSpec.feature "管理者機能", type: :feature do
  before do
    @admin = FactoryBot.create(:admin)
    FactoryBot.create(:product)
  end
  
  scenario "管理者が商品を追加することができる" do
    #ログイン
    visit new_admin_session_path
    fill_in 'admin_email',    with: 'test@test.com'
    fill_in 'admin_password', with: 'testtest'
    first(:link, 'ログイン').click
    #管理者用トップページへ遷移
    expect(current_path).to eq new_customer_session_path

    #ヘッダーの商品一覧リンクをクリック
    click_link "商品一覧"
    expect(current_path).to eq new_admin_product_path

    ##商品登録
    fill_in 'product_name', with: "商品名"
    click_on "新規登録"
    #追加した商品が表示されている
    expect(page).to have_content '商品１'
  end

  # scenario '管理者ユーザーがログアウトできる' do
  #   visit new_admin_session_path
  #   fill_in  'admin_email',    with: 'test@test.com'
  #   fill_in  'admin_password', with: 'testtest'
  #   click_on 'Log in'

    ###（想定外）ログアウトリンクがない
  #   click_on 'ログアウト'
  #   expect(current_path).to new_admin_session_path
  # end
end

