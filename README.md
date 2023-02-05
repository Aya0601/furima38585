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

## users名

|Column               |Type    |Options                    |
|---------------------|--------|---------------------------|
| name                | string | null: false               |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| birth               | text   | null: false               |



### Association
- has_many :items
- has_many :buyers
- has_many :send_address

|## items テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| image     | references | null: false                    |
| item_name | text       | null: false                    |
| direction | text       | null: false                    |
| category  | text       | null: false                    |
| condition | text       | null: false                    |
| postage   | string     | null: false                    |
| origin    | text       | null: false                    |
| days      | integer    | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buyer
- has_one :send_address

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :send_address

## send_address テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| post_code      | text       | null: false                    |
| area           | text       | null: false                    |
| city           | text       | null: false                    |
| address_number | text       | null: false                    |
| house_name     | text       |                                |
| telephone      | text       | null: false                    |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buyer