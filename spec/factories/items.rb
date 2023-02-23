FactoryBot.define do
  factory :item do
    association :user

    item_name    { 'test' }
    direction    { 'test' }
    category_id  { '2' }
    condition_id { '2' }
    postage_id   { '2' }
    area_id      { '2' }
    long_id      { '2' }
    price        { '300' }
  

    

    # 1枚の画像をアップロードする
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

end
