# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ------------|
| email                | string | null: false |
| encrypted_password   | string | null: false |
| name                 | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_kana     | string | null: false |
| first_name_kana      | string | null: false |
| birth_day            | date   | null: false |


### Association

- belong_to :destination
- has_many :item


## destinationテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| user_id	         | integer | null: false, foreign_key: true |
| family_name      | string  | null: false                    |
| first_name       | string  | null: false                    |
| family_name_kana | string  | null: false                    |
| first_name_kana  | string  | null: false                    |
| post_code        | string  | null: false                    |
| prefecture       | string  | null: false                    |
| city             | string  | null: false                    |
| address          | string  | null: false                    |
| phone_number     | string  | null: false                    |


### Association

- belongs_to :user
- belongs_to :order
-

## itemsテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| name  	        | string  | null: false                    |
| price           | string  | null: false                    |
| description     | string  | null: false                    |
| status          | string  | null: false                    |
| shipping_cost   | string  | null: false                    |
| prefecture      | string  | null: false                    |
| user_id	        | integer | null: false, foreign_key: true |
| brand_id	      | integer | null: false, foreign_key: true |
| category_id     | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
-

## orderテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| buyer_user_id   | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :destination
- belongs_to :item


## brandテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | index: true |

### Association

- belongs_to :item


## categoryテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- belongs_to :item
