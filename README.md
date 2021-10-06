# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| nickname             | string | null: false               |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| family_name_kana     | string | null: false               |
| first_name_kana      | string | null: false               |
| birth_day            | date   | null: false               |


### Association

- has_many :orders
- has_many :items


## destination テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order            | references | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false, foreign_key: true |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |


### Association

- belongs_to :order

## items テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |
| price            | integer    | null: false                     |
| description      | text       | null: false                     |
| user             | references | null: false, foreign_key: true  |
| status_id        | integer    | null: false, foreign_key: true  |
| shipping_cost_id | integer    | null: false, foreign_key: true  |
| prefecture_id    | integer    | null: false, foreign_key: true  |
| shipping_day_id  | integer    | null: false, foreign_key: true  |
| category_id      | integer    | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false, foreign_key: true  |
| item   | references | null: false, foreign_key: true  |

### Association

- has_one :destination
- belongs_to :item
- belongs_to :user


