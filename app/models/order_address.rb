class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city,:address,:phone_number, :building_name,:product_id, :token, :user_id 

  with_options presence: true  do
    validates :post_number,format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :prefecture_id, numericality: { other_than: 1}
    validates :phone_number,length: {maximum:11 },format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
    validates :user_id
    validates :product_id
  end


  def save
    purchase = Order.create(user_id: user_id, product_id: product_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building_name: building_name,purchase_id: purchase.id)
  end
end