class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :option
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image, :item_name, :text, :category_id, :status_id, :delivery_fee_id,
              :option_id, :shipping_day_id
    validates :price, numericality: { only_integer: true }, inclusion: {in: 300..9_999_999}
  end


  validates :category_id, :status_id, :delivery_fee_id, :option_id,
            :shipping_day_id, numericality: { other_than: 1 }
end

