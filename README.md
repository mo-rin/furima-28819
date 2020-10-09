# README



# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| item_name        | string  | null: false                    |
| text             | text    | null: false                    |
| price            | integer | null: false                    |
| category_id      | integer | null: false                    |
| status_id        | integer | null: false                    |
| delivery_fee_id  | integer | null: false                    |
| option_id        | integer | null: false                    |
| shipping_day_id | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :option
- belongs_to_active_hash :shipping_day


## orders テーブル

| Column        | Type     | Options                        |
| ------------- | -------- | ------------------------------ |
| user_id       | integer  | null: false, foreign_key: true |
| item_id       | integer  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column         | Type     | Options                        |
| -------------- | -------- | ------------------------------ |
| postlal_code   | string  | null: false                    |
| prefecture_id  | integer  | null: false                    |
| city           | string   | null: false                    |
| house_number   | string   | null: false                    |
| building_name  | string   |                                |
| phone_num      | string   | null: false                    |
| order_id       | integer  | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to_active_hash :prefecture


