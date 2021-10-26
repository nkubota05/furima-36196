FactoryBot.define do
  factory :pay_form do
    token { 'a' }
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011112222' }
  end
end
