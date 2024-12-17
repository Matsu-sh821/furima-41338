# テーブル設計

## users テーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| first_name      | string  | null: false               |
| last_name       | string  | null: false               |
| first_name_kana | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kata | string  | null: false               |
| last_name_kata  | string  | null: false               |
| birth_day       | integer | null: false               |

### Association

- has_many :purchases
- has_many :item
- has_one :address

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | string     | null: false                    |
| category_id        | references | null: false, foreign_key: true |
| item_status_id     | integer    | null: false, foreign_key: true |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_date_id   | integer    | null: false, foreign_key: true |
| price              | integer    | null: false                    |
| buyer_id           | references | null: false, foreign_key: true |
| seller_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchases
- belongs_to :category
- has_many :item_images

## categories テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :item

## item_images テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| item_image | text       | null: false                    |

### Association

- belongs_to :item

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | references | null: false, foreign_key: true |
| block_number   | integer    | null: false, foreign_key: true |
| apartment_name | integer    | null: false                    |
| phone_number   | integer    | null: false, foreign_key: true |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
