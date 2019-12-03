# README

## バージョン情報

### 開発言語
- Ruby バージョン2.6.5

### ソフトウェアフレームワーク
- Ruby on Rails バージョン 5.2.3
- jQuery バージョン 3.4.1
- Git バージョン 2.22.0

### データベース
- PostgreSQL バージョン 11.5

### サーバー
- プラットフォーム 
Heroku OS Ubuntu
- ミドルウェア 
Nginx
- ストレージ 
AWS S3

### ドメイン（仮）
https://anri-tweet.herokuapp.com/

### API
- Cloud Vision API v1
- Cloud Translation API v3
- Twitter API

### OS
- Mac OS 10.10〜
- Windows OS 10〜
- iOS iOS 11〜
- Android 5.0〜

### ブラウザ
- Google Chrome 最新版
- Firefox 最新版
- Safari 最新版
- Edge 最新版
- Internet Explorer バージョン 11〜


## カタログ設計

### アプリケーション名
ANRI - Agency Notice Rescue Information

### アプリケーション概要
ANRIは、緊急時にユーザーの人探しを助けるアプリケーションです。 
アプリ上で画像を投稿すると、画像に関連したハッシュタグを発行し、ユーザーのTwitterのタイムラインに自動投稿します。 
また、ツイートのリプライから、上位のホットワードを検出し、ユーザーのTwitterのタイムラインに再度投稿します。


## 機能一覧

|#|機能名|目的|重要度|
|-----|-----|-----|-----|
|1|ハッシュタグ作成|AWS S3にアップロードした画像からハッシュタグを自動発行する|高|
|2|ハッシュタグ翻訳|発行されたハッシュタグを日本語に自動翻訳する|高|
|3|ツイート投稿|ハッシュタグを使ってTwitterにテキスト・画像を投稿する|高|
|4|ハッシュタグ取得|リプライを形態素解析しハッシュタグを自動発行する|高|
|5|Twitterログイン|ユーザーはTwitter認証でのみログインする|高|
|6|リプライ取得|ユーザーのリプライを取得する|高|
|7|リプライ投稿|ツイートにリプライを投稿する|高|
|8|タイムライン取得|ユーザーのタイムラインを取得する|高|
|9|プロフィール取得|ユーザーのプロフィールを取得する|高|
|10|リツイート投稿|リツイートする|中|
|11|検索|ツイートを検索する|中|
|12|DM取得|ユーザーのDMを取得する|低|
|13|DM投稿|ユーザーのDMを投稿する|低|


## テーブル定義書

### テーブル論理名01
ユーザー情報

### テーブル物理名01
user

### コメント01
ユーザーの基本情報を管理する

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|ユーザーID|uid|string|255|||||ユーザーID|
|3|プロバイダー|provider|string|255|||||プロバイダー|
|4|アカウント名|name|string|255|||||アカウント名|
|5|アカウントID|nickname|string|255|||||アカウントID|
|6|場所|location|string|255|||||場所|
|7|画像|image|string|255|||||画像|
|8|メールアドレス|email|string|255|○||||メールアドレス|
|9|パスワード|encrypted_password|string|255|||||パスワード|
|10|パスワードリセット時のトークン|reset_password_token|string|255|○||||パスワードリセット時のトークン
|11|パスワードリセット時のトークン作成日時|reset_password_sent_at|datetime||||||パスワードリセット時のトークン作成日時|
|12|トークン作成日時|remember_created_at|datetime||||||トークン作成日時|
|13|ログイン回数|sign_in_count|integer|255|||||ログイン回数|
|14|ログイン時間|current_sign_in_at|datetime||||||ログイン時間|
|15|ログアウト時間|last_sign_in_at|datetime||||||ログアウト時間|
|16|ログインIPアドレス|current_sign_in_ip|string|255|||||ログインIPアドレス|
|17|ログアウトIPアドレス|last_sign_in_ip|string|255|||||ログアウトIPアドレス|


### テーブル論理名02
画像情報

### テーブル物理名02
photo

### コメント02
画像情報を管理する

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|画像|file|text|255|||||画像|
|3|外部キー|user_id|text|255||||○|外部キー|


### テーブル論理名03
ActiveStorage::Blob

### テーブル物理名03
active_storage_blob

### コメント03
画像情報のメタデータなど管理する

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|キー|key|string|255|○|||○|キー|
|3|画像名|filename|string|255|○||||画像名|
|4|MIMEタイプ|content_type|string|255|||||MIMEタイプ|
|5|メタデータ|metadata|text|255|||||メタデータ|
|6|サイズ|byte_size|bigint|255|○|||○|サイズ|
|7|チェックサム|checksum|string|255|○||||チェックサム|


### テーブル論理名04
ActiveStorage::Attachment

### テーブル物理名04
active_storage_attachment

### コメント04
ActiveStorage::Blobとphotoモデルの関連付け

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|モデル名|name|string|255|○|||○|モデル名|
|3|モデル名|record_type|string|255|○|||○|モデル名|
|4|外部キー|record_id|bigint|255||||○|外部キー|
|5|外部キー|blob_id|bigint|255||||○|外部キー|


### テーブル論理名05
ラベル情報

### テーブル物理名05
label

### コメント05
画像情報に基づくラベルを管理する

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|ラベル名1|label1|string|255|○||||ラベル名1|
|3|ラベル名2|label2|string|255|○||||ラベル名2|
|4|ラベル名3|label3|string|255|○||||ラベル名3|
|5|ラベル名4|label4|string|255|○||||ラベル名4|
|6|ラベル名5|label5|string|255|○||||ラベル名5|


### テーブル論理名06
画像情報とラベル情報の管理

### テーブル物理名06
label_relationships

### コメント06
photoモデルとlabelモデルの関連付け

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|外部キー|photo_id|bigint|255|○|||○|外部キー|
|3|外部キー|label_id|bigint|255|○|||○|外部キー|


### テーブル論理名07
リプライラベル情報の管理

### テーブル物理名07
reply_label

### コメント07
リプライ情報に基づくラベルを管理する

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|ラベル名1|reply_label1|string|255|○||||ラベル名1|
|3|ラベル名2|reply_label2|string|255|○||||ラベル名2|
|4|ラベル名3|reply_label3|string|255|○||||ラベル名3|
|5|ラベル名4|reply_label4|string|255|○||||ラベル名4|
|5|ラベル名5|reply_label5|string|255|○||||ラベル名5|


### テーブル論理名08
画像情報とリプライラベル情報の管理

### テーブル物理名08
reply_label_relationships

### コメント08
photoモデルとreply_labelモデルの関連付け

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|外部キー|photo_id|bigint|255|○|||○|外部キー|
|3|外部キー|reply_label_id|bigint|255|○|||○|外部キー|


### テーブル論理名08
ツイート情報の管理

### テーブル物理名08
tweet

### コメント08
投稿したtweetのid情報を管理する

|#|カラム論理名|カラム物理名|型|桁|NOTNULL|主キー|インデックス|コメント|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|1|ID|id|integer|15|○||||ID|
|2|ツイートid|tweet|integer|255|○|||○|ツイートid|
|3|外部キー|user_id|text|255||||○|外部キー|
|4|外部キー|photo_id|text|255||||○|外部キー|


# ER図
https://adobe.ly/35NCRY7


## サイトマップ
https://bit.ly/2P6KiTx


## 画面遷移図（プロトタイプ）
https://adobe.ly/2qYrvlj


## ワイヤーフレーム/デザイン
https://adobe.ly/2OKLb53


### 色彩設計
https://adobe.ly/2P0fRhM


## 使用予定Gem

### コア
- rails

### ミドルウェア
- pg
- puma
- unicorn

### フロントエンド
- sass-rails
- autoprefixer-rails
- font-awesome-rails
- jquery-rails
- gon
- uglifier
- slim-rails
- html2slim
- mecab
- natto

### バックエンド
- jbuilder
- bootsnap
- rails-i18n
- bcrypt

### 認証・ユーザー管理
- devise
- omniauth
- omniauth-twitter
- rails_admin
- cancan

### API
- aws-sdk-s3
- google-cloud-vision
- google-cloud-translate
- twitter

### デバッグ
- pry-rails
- better_errors
- binding_of_caller
- faker

### テスト (RSpec)
- factory_bot_rails
- spring-commands-rspec
- rspec-rails
- database_cleaner
- webdrivers

### テスト・開発環境
- byebug
- web-console
- listen
- spring
- spring-watcher-listen
- capybara
- selenium-webdriver
- chromedriver-helper
- tzinfo-data

## チェンジログ
変更あった場合、随時チェンジログを記載する。

- 19/12/02 version1.0 を作成
