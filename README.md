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

# table design

## users table

| Column              | Type         | Options                  |
| ------------------- | ------------ | ------------------------ |
| nickname            | string       | null: false              |
| email               | string       | null: false, unique: true|
| encrypted_password  | string       | null: false              |
| last_name           | string       | null: false              |
| first_name          | string       | null: false              |
| last_name_katakana  | string       | null: false              |
| first_name_katakana | string       | null: false              |
| birthday            | date         | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :buys

## items table

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| product_name          | string     | null: false       |
| price                 | integer    | null: false       |
| product_info          | text       | null: false       |
| category_id           | integer    | null: false       |
| product_status_id     | integer    | null: false       |
| delivery_burden_id    | integer    | null: false       |
| delivery_area_id      | integer    | null: false       |
| estimated_delivery_id | integer    | null: false       |
| user                  | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :buy

## comments table

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| comment | text       | null: false       |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buy table

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address table

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| house_number  | string     | null: false       |
| building      | string     |                   |
| phone         | string     | null: false       |
| buy           | references | foreign_key: true |

### Association

- belongs_to :buy
