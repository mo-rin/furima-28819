# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | integer | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :purchase_histories

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
| shipping_days_id | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_history
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :option
- belongs_to_active_hash :shipping_days


## purchase_histories テーブル

| Column        | Type     | Options                        |
| ------------- | -------- | ------------------------------ |
| user_id       | integer  | null: false, foreign_key: true |
| item_id       | integer  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column               | Type     | Options                        |
| -------------------- | -------- | ------------------------------ |
| postlal_code         | varchar  | null: false                    |
| prefecture_id        | integer  | null: false                    |
| city                 | string   | null: false                    |
| address              | string   | null: false                    |
| blok_name            | string   |                                |
| phone_num            | string   | null: false                    |
| purchase_history_id | integer  | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history
- belongs_to_active_hash :prefecture


