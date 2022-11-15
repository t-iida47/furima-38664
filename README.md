# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| password           | string              | null: false               |
| last-name          | string              | null: false               |
| first-name         | string              | null: false               |
| last-name-kana     | string              | null: false               |
| first-name-kana    | string              | null: false               |
| birth-date         | date                | null: false               |


### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options     |
|-------------------------------------|------------|-------------|
| item-name                           | string     | null: false |
| item-info                           | text       | null: false |
| item-category                       | string     | null: false |
| item-sales-status                   | string     | null: false |
| item-shipping-fee-status            | string     | null: false |
| item-prefecture                     | string     | null: false |
| item-scheduled-delivery             | string     | null: false |
| item-price                          | string     | null: false |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :ship-address

## ship-addresses table

| Column       | Type       | Options     |
|--------------|------------|-------------|
| postal-code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| addresses    | string     | null: false |
| building     | string     | null: false |
| phone-number | string     | null: false |

### Association

- has_one :order