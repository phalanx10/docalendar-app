## users テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| email              | string      | null: false, unique: true      |
| encrypted_password | string      | null: false                    |
| nickname           | string      | null: false                    |

### Association
- has_many :user_groups
- has_many :groups through: user_groups
- has_many :tasks

## tasks テーブル

Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| start_time  | date       | null: false                    |
| end_time    | date       | null: false                    |
| category_id | integer    | null: false                    | Active hash
| priority_id | integer    | null: false                    | Active hash
| user        | references | null: false, foreign_key: true |
| group       | references | null: false, foreign_key: true |

### Association
- belongs_to user
- belongs_to group

## groups テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |

### Association
- has_many :user_groups
- has_many :users through: user_groups
- has_many :tasks

## user_groups テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| group              | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :group