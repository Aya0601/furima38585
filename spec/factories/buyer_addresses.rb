FactoryBot.define do
  factory :buyer_address do
    user_id { "1" }
    item_id { "1" }
    post_code { "111-1111" }
    area_id { "1" }
    city { "横浜市" }
    address_number { "1-1" }
    house_name { "ああ" }
    telephone { "00000000000" }
    token { "test111111111111111" }
  end
end