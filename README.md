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

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | integer | null: false |
| name           | string  | null: false |
| birthday       | integer | null: false |

### Association

- has_many :exhibition_items
- has_many :purchase_items

## exhibition_items テーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| image     | blob    | null: false                    |
| item_name | string  | null: false                    |
| text      | text    | null: false                    |
| price     | integer | null: false                    |
| user_id   | int     | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase_items


## purchase_items テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| item_name          | string   | null: false                    |
| CardID             | integer  | null: false                    |
| ExpireDate         | datetime | null: false                    |
| cvv                | int      | null: false                    |
| user_id            | int      | null: false, foreign_key: true |
| exhibition_item_id | int      | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :exhibition_items


