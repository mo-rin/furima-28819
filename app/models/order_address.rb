class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_num, :item_id, :user_id

  with_options presence: true do
    validates :token, :postal_code, :prefecture_id, :city, :house_number, :phone_num
  end
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_num, format: { with: /\A\d{10}$|^\d{11}\z/ }

  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_num: phone_num, order_id: order.id)
  end
end
