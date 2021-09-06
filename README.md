# FURIMA

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | text   | null: false |
| first_name         | text   | null: false |
| family_name_kana   | text   | null: false |
| first_name_kana    | text   | null: false |
| birthday           | date   | null: false |

### Association

* has_many :items
* has_many :record


## items テーブル

| Column            | Type          | Options                        |
| ----------------- | ------------- | ------------------------------ |
| name              | string        | null: false                    |
| price             | integer       | null: false                    |
| description       | string        | null: false                    |
| category_id       | integer       | null: false                    |
| condition_id      | integer       | null: false                    |
| shipping_day_id   | integer       | null: false                    |
| shipping_cost_id  | integer       | null: false                    |
| shipping_place_id | integer       | null: false                    |

### Association

- belongs_to :user
- has_one    :send
- has_one    :record


## send テーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| post_code      | string        | null: false                    |
| prefecture_id  | string        | null: false                    |
| city           | string        | null: false                    |
| address        | string        | null: false                    |
| building_name  | string        | null: false                    |
| phone          | string        | null: false                    |

### Association

- belongs_to :user


## record テーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| user_id        | references    | foreign_key: true              |
| item_id        | references    | foreign_key: true              |

### Association

- belongs_to :user