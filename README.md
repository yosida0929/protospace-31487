# テーブル設計

## users table

| Column     | Type   | Options  |
| ---------  | ------ | -------- |
| email      | string | NOT NULL |
| password   | string | NOT NULL |
| profile    | text   | NOT NULL |
| occupation | text   | NOT NULL |
| position   | text   | NOT NULL |

### Association

* has_many :prototypes
* has_many :comments

## comments table

| Column   | Type       | Options     |
| ------   | ------     | ----------- |
| text     | text       |  NOT NULL   |
| user     | references |             |
| prototype | references |             |

### Association

- belongs_to :prototype
- belongs_to :user


##  prototypes table

| Column     | Type       | Options            |
| ------     | ------     | ------------------ |
| title      | string     |  NOT NULL          |
| catch_copy | text       |                    |
| concept    | text       |                    |
| image      |            | ActiveStorageで実装 |
| user       | references |                    |

### Association

- belongs_to :user
- has_many :comments