class Product < ApplicationRecord
  belongs_to :user 
  has_one :purchase
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name, length: {maximum:40 }
    validates :description, length: {maximum:1000 }
    validates :price,format: { with: /\A[0-9]+\z/ }, numericality: {greater_than_or_equal_to: 300}
  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :shopping_charge_id
    validates :shopping_area_id
    validates :shopping_date_id
  end  
end
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_charge
  belongs_to :shopping_area
  belongs_to :shopping_date
end