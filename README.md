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

- belongs_to :order
- has_many :items


## destinationテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| post_code        | string  | null: false                    |
| prefecture_id    | integer | null: false                    |
| city             | string  | null: false                    |
| address          | string  | null: false                    |
| building_name    | string  | null: false                    |
| phone_number     | string  | null: false                    |


### Association

- belongs_to :order

## itemsテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name  	         | string  | null: false                    |
| price            | integer | null: false                    |
| description      | text    | null: false                    |
| status_id        | integer | null: false                    |
| shipping_cost_id | integer | null: false                    |
| prefecture_id    | integer | null: false                    |
| user_id	         | integer | null: false                    |
| brand_id	       | integer | null: false                    |
| category_id      | integer | null: false                    |

### Association

- belongs_to :user
- has_one :order


## orderテーブル

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false, foreign_key: true  |
| item   | references | null: false, foreign_key: true  |

### Association

- belongs_to :destination
- belongs_to :item


