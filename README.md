## usersテーブル

|  Column           | Type          | Options        |
| ----------------- | -----------   | -------------- |
|nickname	          | string	      | null: false    |
|email	            | string	      | null: false, unique: true   |
|encrypted_password | string        | null: false    |
|family_name	      | string	      | null: false    |
|first_name	        | string	      | null: false    |
|family_name_kana	  | string	      | null: false    |
|first_name_kana	  | string	      | null: false    |
|birth_day	        | date	        | null: false    |

### Association
- has_many   : products
- has_many   : comments
- has_many : purchases

## addressesテーブル

|  Column           | Type        | Options                        |
| ----------------- | ----------- |  --------------                |
| purchase          |	references  | null: false, foreign_key: true |
| prefecture_id	    | integer	    | null: false                    |
| city	            | string	    | null: false                    |
| address           |	string	    | null: false                    |
| building_name     |	string	    |                    |
| phone_number	    | string      | null: false                    |
| post_number       | string      | null: false

### Association
- belongs_to : purchase

## commentsテーブル

|  Column           | Type        | Options                        |
| ----------------- | ----------- | --------------                 |
| user_id           | integer	    | null: false, foreign_key: true |
| body              | text        |                                |

### Association
- belongs_to : user
- belongs_to : product



## productsテーブル

|  Column               | Type          | Options                        |
| -----------------     | -----------   | --------------------------     |
| name                  | integer       | null: false                    |
| description           | text       | null: false                    |
| price	                | integer	      | null: false                    |
| shopping_charge_id	  | integer	      | null: false                    |
| shopping_area_id	    | integer	      | null: false                    |
| shopping_date_id	    | integer	      | null: false                    |
| category_id	          | integer  	    | null: false, foreign_key: true |
| status_id             | integer       | null: false                    |
| user                  | references	  | null: false, foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :brand 
- has_many :comments
- has_one :purchase

## brandsテーブル

|  Column           | Type        | Options        |
| ----------------- | ----------- | -------------- |
| name	            | string	    | index: true    |

### Association
- has_many :products

## purchasesテーブル

|  Column               | Type        | Options                        |
| -----------------     | ----------- | -----------------------        |
| user	                | references  | null: false, foreign_key: true |
| product              | references	| null: false, foreign_key: true |

### Association
- belongs_to :product
- belongs_to :user
- has_one :address