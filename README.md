# README


# DB(Model関連Tabel)設計

----------------------------------------------------------

## users(ユーザー管理機能) Table

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false             	|
| email              | string   | null: false, unique: true	|
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false             	|
| last_name          | string   | null: false             	|
| first_name_kana    | string   | null: false             	|
| last_name_kana     | string   | null: false             	|
| birth_date         | datetime | null: false             	|


### Association
- has_many :items
- has_many :orders
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


## items(商品出品機能) Table

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| brand      | string     | null: false                    |
| price      | integer    | null: false                    |
| image      | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| category   | string     | null: false                    |
| situation  | text       | null: false                    |
| area       | string     | null: false                    |
| send_date  | datetime   | null: false                    |


### Association
- belongs_to :user
- has_one :order
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


## orders(商品購入機能) Table
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
<!-- 決済：クレジットカード決済代行サービス[pay.jp] -->

### Association
- belongs_to :user 
- has_many :items
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


## deliveries Table
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_number | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| tawn        | string     | null: false                    |
| tel_number  | integer    | null: false                    |
