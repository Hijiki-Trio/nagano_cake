# Nagano Cake

DMM WEBCAMPのチーム開発で作成したECサイト

## 設計

### ER図

<img width="690" alt="スクリーンショット 2021-06-23 11 06 22" src="https://user-images.githubusercontent.com/81577119/123023856-1ebb7180-d413-11eb-80e5-0ae48832cba5.png">

### アプリケーション詳細設計
#### 管理者側

<img width="713" alt="スクリーンショット 2021-06-23 10 55 51" src="https://user-images.githubusercontent.com/81577119/123023229-03039b80-d412-11eb-8d73-37e0f25e2e97.png">

#### 会員側

<img width="719" alt="スクリーンショット 2021-06-23 10 56 25" src="https://user-images.githubusercontent.com/81577119/123023080-c2a41d80-d411-11eb-9f64-ecc91a9daeb6.png">

## 開発環境

* Ruby 2.6.3
* Ruby on Rails 5.2.5

## 使用方法

```
$ git clone https://github.com/Hijiki-Trio/nagano_cake.git
$ cd nagano_cake
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails s
```

## 機能

* ログイン/ログアウト機能
* 退会機能
* 注文機能
* カート機能

## 作者

* あむ
* よっしー
* あかりん
