# FURIMA

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| family_name        | text   | null: false |
| first_name         | text   | null: false |
| family_name_kana   | text   | null: false |
| first_name_kana    | text   | null: false |
| birthday           | date   | null: false |

### Association

* has_many :items


## items テーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| name           | string        | null: false                    |
| price          | string        | null: false                    |
| image          | string        |                                |
| description    | string        | null: false                    |
| category       | string        | null: false                    |
| condition      | string        | null: false                    |
| shipping_day   | string        | null: false                    |
| shipping_cost  | string        | null: false                    |
| shipping_place | string        | null: false                    |

### Association

- belongs_to :user
- has_one    :purchase
- has_one    :send

## purchase テーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| card_id        | references    | foreign_key: true              |
| security_id    | references    | foreign_key: true              |
| customer_id    | references    | foreign_key: true              |

### Association

- belongs_to :items


## send テーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| post_code      | string        | null: false                    |
| prefecture     | string        | null: false                    |
| city           | string        | null: false                    |
| address        | string        | null: false                    |
| building_name  | string        | null: false                    |
| phone          | string        | null: false                    |

### Association

- belongs_to :items