## DoCalendar
[![Image from Gyazo](https://i.gyazo.com/70afbb0f9a31bc2c0f75dd64851f5d93.jpg)](https://gyazo.com/70afbb0f9a31bc2c0f75dd64851f5d93)
URL: https://docalendar-app.herokuapp.com

Basic認証: ユーザー名: admin
          パスワード: 2222

## 概要
DoCalendarとはタスクカードとカレンダーを使用したサバイバルゲーマーのためのToDoアプリケーションサービスです。

## 使用技術
- フレームワーク：Rails6.0.0
- フロント：css
- サーバーサイド言語：Ruby2.6.5
- データベース：MySQL
- コードチェック：RuboCop
- バージョン管理：GitHub
- デプロイ環境：heroku
- ユーザー管理：devise
- 検索絞込み機能：ransak
- 画像保存： Active_Storage
- カレンダー機能: simple_calendar
- 使用マシン：Mac Catalina(10.15.7)
- 開発期間（約 3 週間）

## 目指した課題解決

予定管理の観点から
- タスクだけのToDoアプリだと長期的な予定を管理するのが大変という課題への解決
- 重要なタスクかどうかを視覚的に瞬時に見分ける必要があるという課題への解決

サバイバルゲームの観点から
- カスタムや修理の受取日などサバイバルゲーム特有の予定が一般のToDoアプリのカテゴリーに存在しないという課題への解決

## メイン機能

登録したユーザーは、タスクの作成・編集が行えます。

[![Image from Gyazo](https://i.gyazo.com/c37d67d7768db3e41e3795ab7855095d.gif)](https://gyazo.com/c37d67d7768db3e41e3795ab7855095d)


タブから今月のカレンダーを見ることができます。

- 当日は水色で、予定の入っている日は緑色で表示されます。

[![Image from Gyazo](https://i.gyazo.com/f878644e707a4ab4c70fe66d805cd501.jpg)](https://gyazo.com/f878644e707a4ab4c70fe66d805cd501)

## サブ機能

- ゲストログイン機能
- タスク詳細確認機能
- タスク編集/削除機能
- タスク名検索機能
- タスク優先度絞り込み機能

## 追加実装予定

- タスク共有機能(複数のユーザーが同じ予定を共有する機能)
- タスクコメント機能(予定を共有するユーザー同士が疎通するための機能)

## こだわった点

[![Image from Gyazo](https://i.gyazo.com/6bfb106fce387d81eeeea409541f7e86.jpg)](https://gyazo.com/6bfb106fce387d81eeeea409541f7e86)

- 優先度によってタスクの色が変更される点
- タブ機能を採用しカレンダーとタスクの確認を容易にした点

## DoCalendarのER図

![DoCalendarのER図](app/assets/images/er.png)

## テーブル構成

## users テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| email              | string      | null: false, unique: true      |
| encrypted_password | string      | null: false                    |
| nickname           | string      | null: false                    |

### Association
- has_many :tasks

## tasks テーブル

Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| start_time  | datetime   | null: false                    |
| category_id | integer    | null: false                    |
| priority_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to user

## Active_hash
- category
- priority