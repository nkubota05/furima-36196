# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| name                 | string | null: false               |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| family_name_kana     | string | null: false               |
| first_name_kana      | string | null: false               |
| birth_day            | date   | null: false               |


### Association

- has_one :order
- has_many :items


## destinationテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | references | null: false, foreign_key: true |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |


### Association

- belongs_to :order

## itemsテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| name          | string     | null: false                     |
| price         | integer    | null: false                     |
| description   | text       | null: false                     |
| status        | references | null: false, foreign_key: true  |
| shipping_cost | references | null: false, foreign_key: true  |
| prefecture    | references | null: false, foreign_key: true  |
| user	        | references | null: false, foreign_key: true  |
| brand	        | references | null: false, foreign_key: true  |
| category      | references | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :order


## orderテーブル

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false, foreign_key: true  |
| item   | references | null: false, foreign_key: true  |

### Association

- has_one :destination
- belongs_to :item
- belongs_to :user


