FactoryBot.define do
  factory :send_address do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    area_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address_number { Faker::Address.street_address }
    house_name { Faker::Address.street_address }
    telephone { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
