FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'姓'}
    first_name            {'名前'}
    last_name_katakana    {'セイ'}
    first_name_katakana   {'ナマエ'}
    birthday              {'2000-01-01'}
  end
end