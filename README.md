# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :profile


## profile テーブル

| Column              | Type         | Options     |
| ------------------- | ------------ | ----------- |
| last_name           | string       | null: false |
| first_name          | string       | null: false |
| last_name_katakana  | string       | null: false |
| first_name_katakana | string       | null: false |
| birthday_year       | date         | null: false |
| birthday_month      | date         | null: false |
| birthday_day        | date         | null: false |
| user                | references   |             |

### Association

- belongs_to :users


## items テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| item_name         | string     | null: false |
| item_image        | string     | null: false |
| price             | integer    | null: false |
| item_info         | text       | null: false |
| category          | string     | null: false |
| syouhin_joutai    | string     | null: false |
| haisou_hutan      | string     | null: false |
| haisoumoto_chiiki | string     | null: false |
| haisou_meyasu     | string     | null: false |
| user              | references |             |

### Association

- has_many :comments
- has_one :buy
- has_one :address
- belongs_to :users


## comments テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| comment | text       | null: false |
| user    | references |             |
| item    | references |             |

### Association

- belongs_to :users
- belongs_to :items


## buy テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| card_number   | integer    | null: false |
| yuukou_kigen  | integer    | null: false |
| security_code | integer    | null: false |
| item          | references |             |

### Association

- belongs_to :items


## address テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | integer    | null: false |
| prefecture   | string     | null: false |
| municipality | string     | null: false |
| banchi       | string     | null: false |
| tatemono     | string     | null: false |
| phone        | integer    | null: false |
| item         | references |             |

### Association

- belongs_to :items
