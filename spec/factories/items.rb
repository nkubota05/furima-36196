FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.characters(100) }
    price { Faker::Number.number(digits: 7) }
    status_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    category_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
