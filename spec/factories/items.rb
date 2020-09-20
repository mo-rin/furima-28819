FactoryBot.define do
  factory :item do
    item_name        {"負け犬"}
    text             {"自分自身に負けた者"}
    category         {"メンズ"}
    status           {"未使用に近い"}
    delivery_fee     {"着払い（購入者負担）"}
    option           {"鳥取県"}
    shipping_day     {"2〜3日で発送"}
    price            {"90000"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
 
  end
end
