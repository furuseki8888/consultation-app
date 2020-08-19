# README

# consultation_app DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|

### Association
- has_many :posts
- has_many :comments
- has_one :profile, dependent: :destroy

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|prefecture_id|integer|null: false|
|introduction|text||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true
- belongs_to_active_hash :prefecture

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|image|string||
|user_id|references|null: false, foreign_key: true|

### Association
- has_many :comments
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post