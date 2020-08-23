# アプリ名：「relief」
<img width="1102" alt="hero" src="https://user-images.githubusercontent.com/67250024/90983504-afce7b80-e5a9-11ea-869a-e16b0667570e.png">

## 概要
悩みを投稿して、みんなで解決方法や気持ちを軽くする方法を考えたり共有できるアプリです。

## 本番環境
  * URL：http://18.180.198.25
  * テスト用アカウント
    * メールアドレス：t@t
    * パスワード：tttttt

## 特徴
１つの投稿に対してコメントやいいね(共感)ができます。
<img width="1100" alt="v" src="https://user-images.githubusercontent.com/67250024/90983703-04262b00-e5ab-11ea-94a2-bb9458a5a83e.png">
マイページで自分の投稿やどのくらい共感されているか確認できます。
<img width="1100" alt="cc" src="https://user-images.githubusercontent.com/67250024/90983644-9a0d8600-e5aa-11ea-8287-2a6fc36d32a8.png">
トップページに最新投稿が5件表示されます。
<img width="836" alt="aa" src="https://user-images.githubusercontent.com/67250024/90983595-4d29af80-e5aa-11ea-8399-7afb90d3c54f.png">

## 制作背景
現代は技術が発達し便利な世の中ですが、それと同時に悩みも多様化していると感じます。私も日々様々なことに悩み、葛藤しながら生きています。
「relief」は安心や救済という意味です。一人で閉じこもって悩まず、みんなで悩みを共有したり、気持ちが楽になる方法など気軽に話し合える場があればいいなという思いからこのアプリを作成しました。

## 工夫したポイント
  * アプリ全体を気持ちが落ち着く色味で統一して作成しました。
  * トップページで最新投稿が5件表示されるようになっています。
  * 投稿詳細ページで「いいね(共感)」ができ、マイページや投稿一覧ページでは共感されている数が確認できます。

## 使用技術
  * Ruby
  * Ruby on Rails
  * Java Script
  * jQuery
  * haml,sass

## 課題や今後実装したい機能
  * 投稿のタグ機能
  * 投稿検索機能
  * ベストアンサー機能
  * レスポンシブデザイン

# DB設計
![table](https://user-images.githubusercontent.com/67250024/90980257-3af14680-e595-11ea-8277-4d8838fffab1.png)

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
- has_many :posts, dependent: :destroy
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liked_posts, through: :likes, source: :post
- has_one :profile, dependent: :destroy

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|prefecture_id|integer||
|introduction|text||
|image|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true
- belongs_to_active_hash :prefecture

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string||
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
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

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post