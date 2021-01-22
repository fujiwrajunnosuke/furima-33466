## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type        | Options           |
|-------------------------------------|-------------|-------------------|
| image                               | active型    |                   |
| name                                | string      | null: false       |
| introduction                        | text        | null: false       |
### Association

- has_many :users
- has_many :orders

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :iteｍ