# README

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

## usersテーブル
|user|||
|----|----|----|
|email|string|null:false, unique:true|
<!-- |name|string|null:false, unique:true|
|password|string|null:false, unique:true| -->
### Association
- has_many :credit_cards
- has_one :profile
- has_one :user_address
<!-- - belongs_to :point -->
- has_many :favorites
- has_many :todo_lists
- has_many :comments
- has_many :evaluations


## evaluations
|user_id|references|null:false,foreign_key:true|
|production_id|references|null:false,foreign_key:true|
|review|text||
### Association
- belongs_to :production
- belongs_to :user


## クレジットカード
|user_id|references null:false|foreign_key:true|
|card_number|integer null:false|
|thru_month|integer null:false|
|thru_year|integer null:false|
|security_code|integer null:false|
### アソシエーション
- belongs_to :user


## images
|production_id|references null:false|foreign_key:true|
|image_url|strings null:false|
### アソシエーション
<!-- - belongs_to :user -->
- belongs_to :production


## productionsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
|name|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|price|string|null: false|
|introduction|text|null: false|
|production_status|string|null: false|
|size|string|null: false|
|shipping_charge|string|null: false|
|prefecture_code|integer|null: false|
|shipping_method|string|null: false|
|detail_date|string|null: false|
|trading_status|string|null: false|
|production_img_id|null:false, foreign_key: true|

### Association
belongs_to :category
belongs_to :brand
belongs_to :evaluation
has_many :favorites
has_many :images, dependent: :destroy
has_many :comments


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
has_many :productions


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
has_many :productions


## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :production


## to_do_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|null: false, foreign_key: true|
|list|text|null: false|
### Association
- belongs_to :user


## user_addressesテーブル
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
|building_name|string|
|phone_number|integer|null: false, unique: true|
|user_id|string|null: false, foreign_key: true|
### Association
belongs_to :user


## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
|point|integer|
### Association
belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :production
- belongs_to :user


## profiles
|first_name|string null:false|
|family_name|string null:false|
|first_name_kana|string null:false|
|family_name_kana|string null:false|
|birth_year|date null:false|
|birth_month|date null:false|
|birth_day|date null:false|
|introduction|text|
|user_id|reference null:false|foreign_key:true|
### アソシエーション
- belongs_to :user