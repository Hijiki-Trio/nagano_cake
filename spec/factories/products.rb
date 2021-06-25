FactoryBot.define do
  factory :product do
    name { '商品A' }
    price { '100' }
    detail { 'ホゲホゲホゲホゲホゲホゲホゲホゲ' }
    association :genre
  end
end
