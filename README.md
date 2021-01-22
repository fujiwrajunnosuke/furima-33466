## users table

| Column                | Type                | Options                 |
|-----------------------|---------------------|-------------------------|
| name                  | string              | null: false             |
| email                 | string              | null: false             |
| encrypted_password    | string              | null: false             |
| family_name           | string              | null: false             |
| first_name            | string              | null: false             |
| call_family_name      | string              | null: false             |
| call_first_name       | string              | null: false             |
| birth_day             | integer             | null: false             |

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
| delivery_price                      | integer     | null: false       |
| delivery_prefectures                | integer     | null: false       |
| delivery_days                       | integer     | null: false       |
| price                               | integer     | null: false       |

### Association

- belongs_to :users
- belongs_to :orders

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

### アソシエーションをもう一度確認ください。
現状userとitemが多対多となっております。
ユーザーはたくさんの商品を出品できますが、商品は一人のユーザーにしか紐づきません。
また、商品一つに対しては購入履歴は一つしか紐づきません。

このことから、アソシエーションを再度考えてみましょう！

## address table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| postal_code        | integer    | null: false       |
| prefectures        | integer    | null: false       | 
| municipality       | string     | null: false       |
| house_number       | integer    | null: false       |
| building_name      | string     |                   |
| phone_number       | integer    | null: false       |