FactoryBot.define do
  factory :item do
    item_name        { '負け犬' }
    text             { '自分自身に負けた者' }
    category_id         { 2 }
    status_id           { 2 }
    delivery_fee_id     { 2 }
    option_id           { 2 }
    shipping_day_id     { 2 }
    price { '90000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
