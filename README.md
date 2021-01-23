## users table

| Column                | Type                | Options                       |
|-----------------------|---------------------|-------------------------------|
| name                  | string              | null: false                   |
| email                 | string              | null: false, uniqueness: true |
| encrypted_password    | string              | null: false                   |
| family_name           | string              | null: false                   |
| first_name            | string              | null: false                   |
| call_family_name      | string              | null: false                   |
| call_first_name       | string              | null: false                   |
| birth_day             | integer             | null: false                   |


### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type        | Options           |
|-------------------------------------|-------------|-------------------|
| name                                | string      | null: false       |
| introduction                        | text        | null: false       |
| category_id                         | integer     | null: false       |
| state_id                            | integer     | null: false       |
| delivery_price_id                   | integer     | null: false       |
| delivery_prefecture_id              | integer     | null: false       |
| delivery_day_id                     | date        | null: false       |
| price                               | integer     | null: false       |
| user                                | references  | foreign_key: true |

- belongs_to :user
- has_one :order

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| postal_code        | string     | null: false       |
| prefectures_id     | integer    | null: false       | 
| municipality       | string     | null: false       |
| house_number       | string     | null: false       |
| building_name      | string     |                   |
| phone_number       | string     | null: false       |

### Association

- belongs_to :order