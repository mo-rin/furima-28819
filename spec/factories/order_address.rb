FactoryBot.define do
  factory :order_address do
    token { 'neruhhrjnro' }
    postal_code { '123-4567' }
    prefecture_id { 5 }
    city { 'さいたま' }
    house_number { '大宮1-1' }
    building_name { 'スカイハイツ1-3' }
    phone_num { '09012345678' }
   
  end
end
