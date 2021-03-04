# アプリ名
membo(仮)

# 概要
バンドメンバーを探す事ができる。  
バンドが、不足しているパートの奏者をスカウトする。  
奏者が、募集しているバンドへエントリーする。

# 制作背景
コンタクトを取った段階ではお互いの技術の水準がわかりにくい。  
事前に技術水準を把握できるよう、数小節分の「必殺技」を動画ないしは音声で登録する。

# 実装予定内容
テキスト・画像・動画・音声でのユーザー情報登録  
奏者募集機能  
スカウト待ち機能

# テーブル設計

## usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| encrypted_password  | string  | null: false               |
| email               | string  | null: false, unique: true |
| prefecture_id       | string  | null: false               |
| area                | string  | null: false               |
| age                 | integer | null: false               |
| part                | string  | null: false               |
| my_hero             | string  | null: false               |

### Association

- has_many :wants
- has_many :entries

## Wantsテーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| name              | string    | null: false                    |
| text              | text      | null: false                    |
| prefecture_id     | integer   | null: false                    |
| user              | reference | null: false, foreign_key: true |

### Association
- belongs_to :user

## Entriesテーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| user        | reference | null: false, foreign_key: true |
| text        | text      | null: false, foreign_key: true |

### Association
- belongs_to :user

