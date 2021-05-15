FactoryBot.define do
  factory :item do
    product_name          {Faker::Lorem.characters(number: 40)}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    product_info          {Faker::Lorem.characters(number: 1000)}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    product_status_id     {Faker::Number.between(from: 2, to: 7)}
    delivery_burden_id    {Faker::Number.between(from: 2, to: 3)}
    delivery_area_id      {Faker::Number.between(from: 2, to: 48)}
    estimated_delivery_id {Faker::Number.between(from: 2, to: 4)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
