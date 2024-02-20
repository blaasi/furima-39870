# テーブル設計

## Users テーブル
| Column | Type  | Options  |
| - | - | - |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |


### Association
- has_many :items
- has_many :orders


## Items テーブル
| Column | Type  | Options  |
| - | - | - |
| name | string | null: false |
| explanation | text | null: false |
| category_id | integer | null: false |
| status_id | integer | null: false |
| shipping_cost_payer_id | integer | null: false |
| origin_region_id | integer | null: false |
| days_until_shipping_id | integer | null: false |
| sale_price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- belongs_to :category
- belongs_to :status
- belongs_to :shipping_cost_payer
- belongs_to :origin_region
- belongs_to :days_until_shipping


## Orders テーブル
| Column | Type  | Options  |
| - | - | - |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## Addresses テーブル
| Column | Type  | Options  |
| - | - | - |
| postcode | string | null: false |
| origin_region_id | integer | null: false |
| city | string | null: false |
| street_address | string | null: false |
| building_name | string |  |
| telephone_number | string | null: false |
| order | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to :origin_region