# テーブル設計

## Users テーブル
| Column | Type  | Options  |
| - | - | - |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| password | string | null: false |
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
| category | string | null: false |
| status | string | null: false |
| shipping_cost_payer | string | null: false |
| origin_region | string | null: false |
| days_until_shipping | string | null: false |
| sale_price | integer | null: false |
| seller_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## Orders テーブル
| Column | Type  | Options  |
| - | - | - |
| item_id | references | null: false, foreign_key: true |
| Buyer_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## Shipping_address テーブル
| Column | Type  | Options  |
| - | - | - |
| postcode | string | null: false |
| prefecture | string | null: false |
| city | string | null: false |
| street_address | string | null: false |
| building_name | string |  |
| telephone_number | integer | null: false |

### Association
- belongs_to :order
