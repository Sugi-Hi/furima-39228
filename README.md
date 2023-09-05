# README

<!-- This README would normally document whatever steps are necessary to get the
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

* ... -->


# DB(Model関連Tabel)設計

----------------------------------------------------------

## users(ユーザー管理機能) Table

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false             	|
| email              | string   | null: false, unique: true	|
| encrypted_password | string   | null: false, unique: true |
| first_name         | string   | null: false             	|
| last_name          | string   | null: false             	|
| first_name_kana    | string   | null: false             	|
| last_name_kana     | string   | null: false             	|
| birth_date         | datatime | null: false             	|


### Association
- has_many :items
- has_many :orders
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


## items(商品出品機能) Table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


## orders(商品購入機能) Table
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| pay       | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- has_one :user
- has_one :order
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

-----使用検討中-----
## deliverys Table