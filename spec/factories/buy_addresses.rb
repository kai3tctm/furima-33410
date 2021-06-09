FactoryBot.define do
  factory :buy_address do
    postal_code      {'123-4567'}
    delivery_area_id {Faker::Number.between(from: 2, to: 48)}
    municipality     {'市区町村'}
    house_number     {'1-1'}
    building         {'試験ビル'}
    phone            {Faker::Number.number(digits: 11)}
  end
end
