# README fleamarket_sample_80e DB設計

フリマアプリのクローンサイト。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。 ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。

## リンク
・IPアドレス：http://18.180.31.233/

Basic認証をかけています。ご覧の際は以下のIDとPassを入力してください。

・Basic認証
  ◦ID: m80teame
  ◦Pass: otnm80


## テストユーザー

◯ 購入者用

  ◦メールアドレス：test@gmail.com
  ◦パスワード：testtest

◯ 購入用カード情報

  ◦番号：4242424242424242
  ◦期限：1/25
  ◦セキュリティコード：123

◯ 出品者用

  ◦メールアドレス：hanako@gmail.com
  ◦パスワード：hanako1


## :ペーパークリップ: 主な使用言語
<a><img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="70px;" /></a> <!-- rubyのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774548-731b2900-2fb4-11ea-99ba-565546c5acb4.png" height="60px;" /></a> <!-- RubyOnRailsのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="60px;" /></a> <!-- Hamlのロゴ -->
<a><<img src="https://user-images.githubusercontent.com/39142850/71774644-115bbe80-2fb6-11ea-822c-568eabde5228.png" height="60px" /></a> <!-- Scssのロゴ -->

<a><img src="https://prokatsu.com/wp/wp-content/uploads/2017/02/js.png" height="65px;" /></a> <!-- javascriptのロゴ -->

<a><img src="https://user-images.githubusercontent.com/39142850/71774768-d064a980-2fb7-11ea-88ad-4562c59470ae.png" height="65px;" /></a> <!-- jQueryのロゴ -->
<a><img src="https://user-images.githubusercontent.com/67769876/91068711-a0196a80-e66f-11ea-9e03-92d97eef5736.png" height="65px;" /></a> <!-- herokuのロゴ -->

<a><img src="https://i-think-it.net/wp-content/uploads/2019/05/Linux_Pengin_logo.png" height="65px;" /></a><!-- Linuxのロゴ -->

<a><img src="https://cdn-ssl-devio-img.classmethod.jp/wp-content/uploads/2016/08/mysql-320x320.png" height="65px;" /></a> <!-- MYSQLのロゴ -->

<a><img src="https://pbs.twimg.com/profile_images/1217566226827759616/hM6lnfw8_400x400.jpg" height="65px;" /></a> <!-- AWSのロゴ -->





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


