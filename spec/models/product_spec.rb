require 'rails_helper'

RSpec.describe Product, type: :model do
   describe '商品の新規作成' do
     before do
       @genre = FactoryBot.create(:genre)
     end
     
    it '正しい内容が入力されている' do
      genre = @genre
      product = Product.new(
        name: "ホゲホゲ",
        detail: "ホゲホゲ",
        price: "100",
        is_active: "制作中",
        genre_id: 1,
      )
      expect(product).to be_valid
    end
  end
end