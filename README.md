# テーブル設計

## usersテーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false                   |
| email              | string | null: false, unique_key: true |
| encrypted_password | string | null: false                   |
| family_name        | string | null: false                   |
| first_name         | string | null: false                   |
| family_name_kana   | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birthday           | date   | null: false                   |

### Association
- has_many :items
- has_many :cards

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| cost_id       | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :card

## cardsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :information

## destinationsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| card          | references | null: false, foreign_key: true |

### Association
- belongs_to :card