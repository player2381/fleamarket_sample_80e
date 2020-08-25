# README fleamarket_sample_80e DB設計

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 6.0.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users
|Column|Type|Options|
|------|----|-------|
|birth_date|date|null: false|
|name|string|null:false|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default:""|
|reset_password_token|string|null: false|
### Association
- has_one :address
- has_one :card
- has_many :productions


## card
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user


## images
|Column|Type|Options|
|------|----|-------|
|production_id|references|null: false, foreign_key: true|
|src|strings|null:false|
### Association
- belongs_to :production


## productions
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|name|string|null: false|
|category_id|integer|null: false, foreign_key:true|
|price|integer|null: false|
|introduction|text|null: false|
|purchaser_id|references|foreign_key: true|
|size|string|null: false|
|shipping_charge|string|null: false|
|prefecture_code|string|null: false|
|detail_date|string|null: false|
|trading_status|string|null: false|
### Association
- belongs_to :category
- belongs_to :user, foreign_key: 'user_id'
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images,
  allow_destroy:true


## category
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :productions
- has_ancestry


## addresses
|Column|Type|Options|
|------|----|-------|
|address_first_name|string|null: false|
|address_family_name|string|null: false|
|address_first_name_kana|string|null: false|
|address_family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string|null: false, unique: true|
|user_id|string|null: false, foreign_key: true|
### Association
- belongs_to :user, optional: true


## purchase
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|production_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :card
- belongs_to :production


## customer
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user
