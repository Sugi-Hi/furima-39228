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
| birth_date         | date     | null: false             	|


### Association
- has_many :items
- has_many :orders
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


## items(商品出品機能) Table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| explain     | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| postfee_id  | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| shipdate_id | integer    | null: false                    |


### Association
- belongs_to :user
- has_one :order ,dependent: 
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
- belongs_to :delivery dependent:
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


## deliveries Table
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_number | string     | null: false                    |
| city        | string     | null: false                    |
| tawn        | string     | null: false                    |
| bulid       | string     | null: false                    |
| tel_number  | string     | null: false                    |

### Association
- belongs_to :order
