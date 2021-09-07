# FURIMA

## usersテーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| family_name        | string | null: false                |
| first_name         | string | null: false                |
| family_name_kana   | string | null: false                |
| first_name_kana    | string | null: false                |
| birthday           | date   | null: false                |

### Association

* has_many :items
* has_many :orders


## items テーブル

| Column            | Type          | Options                        |
| ----------------- | ------------- | ------------------------------ |
| user              | references    | foreign_key: true, null: false |
| name              | string        | null: false                    |
| price             | integer       | null: false                    |
| description       | text          | null: false                    |
| category_id       | integer       | null: false                    |
| condition_id      | integer       | null: false                    |
| shipping_day_id   | integer       | null: false                    |
| shipping_cost_id  | integer       | null: false                    |
| shipping_place_id | integer       | null: false                    |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| user           | references    | foreign_key: true, null: false |
| item           | references    | foreign_key: true, null: false |

### Association

- belongs_to :user
- has_one    :item
- has_one    :address


## addresses テーブル

| Column            | Type          | Options                        |
| ----------------- | ------------- | ------------------------------ |
| post_code         | string        | null: false                    |
| shipping_place_id | integer       | null: false                    |
| city              | string        | null: false                    |
| address           | string        | null: false                    |
| building_name     | string        |                                |
| phone             | string        | null: false                    |
| order             | references    | foreign_key: true, null: false |

### Association

- has_one    :order
