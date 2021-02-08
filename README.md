## usersテーブル

|  Column           | Type          | Options        |
| ----------------- | -----------   | -------------- |
|nickname	          | string	      | null: false    |
|email	            | string	      | null: false, foreign_key: true    |
|password           |	string	      | null: false    |
|family_name	      | string	      | null: false    |
|first_name	        | string	      | null: false    |
|family_name_kana	  | string	      | null: false    |
|first_name_kana	  | string	      | null: false    |
|birth_day	        | date	        | null: false    |

### Association
- has_many   : products
- has_many   : comments
- belongs_to : customer
- belongs_to : card
- belongs_to : purchases

## addressテーブル

|  Column           | Type        | Options                        |
| ----------------- | ----------- |  --------------                |
| user_id           |	references  | null: false, foreign_key: true |
| prefecture	      | string	    | null: false                    |
| city	            | string	    | null: false                    |
| address           |	string	    | null: false                    |
| building_name     |	string	    | null: false                    |
| phone_number	    | integer     | null: false                    |

### Association
- belongs_to : user

## commentsテーブル

|  Column           | Type        | Options                        |
| ----------------- | ----------- | --------------                 |
| user_id           | integer	    | null: false, foreign_key: true |
| body              | text        |                                |

### Association
- belongs_to : user
- belongs_to : product


## cardテーブル

|  Column           | Type        | Options                        |
| ----------------- | ----------- | ----------------------------   |
| user_id	          | integer	    | null: false, foreign_key: true |
| card_number	      | integer	    | null: false                    |
| year              | integer	    | null: false                    |
| month             | integer	    | null: false                    |
| security_number   | integer	    | null: false                    |


### Association
- belongs_to : user

## categoryテーブル

|  Column           | Type        | Options        |
| ----------------- | ----------- | -------------- |
| name	            | string	    | null: false    |
| ancestry	        | string	    |                |

### Association
- has_many :products

## productテーブル

|  Column           | Type          | Options                        |
| ----------------- | -----------   | --------------------------     |
| price	            | integer	      | null: false                    |
| shopping_charge	  | string	      | null: false                    |
| shopping_area	    | string	      | null: false                    |
| shopping_date	    | string	      | null: false                    |
| category_id	      | references  	| null: false, foreign_key: true |
| brand_id	        | references	  | null: false, foreign_key: true |
| user_id	          | references	  | null: false, foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :category 
- belongs_to :brand 
- has_many :images 
- has_many :comments
- has_many :purchases

## imageテーブル

|  Column             | Type        | Options                        |
| -----------------   | ----------- | -----------------------        |
| image	              | text  	    | null: false                    |
| product_id	        | integer	    | null: false, foreign_key: true |

### Association
- belongs_to :product

## brandテーブル

|  Column           | Type        | Options        |
| ----------------- | ----------- | -------------- |
| name	            | string	    | index: true    |

### Association
- has_many :products

## purchasesテーブル

|  Column               | Type        | Options                        |
| -----------------     | ----------- | -----------------------        |
| user_id	              | references  | null: false, foreign_key: true |
| category_id	          | references	| null: false, foreign_key: true |

### Association
- belongs_to :product
- belongs_to :user