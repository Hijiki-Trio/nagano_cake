FactoryBot.define do
  factory :customer do
    first_name { '新田' }
    last_name { '真剣佑' }
    first_name_kana { 'アラタ' }
    last_name_kana { 'マッケンユウ' }
    postcode { '00000000' }
    address { '東京都目黒区' }
    phone_number { '00000000' }
    email { 'arata@email.com' }
    password { '222222' }
    password_confirmation { '222222' }
  end
    
end
