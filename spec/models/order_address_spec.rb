require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    product = FactoryBot.create(:product)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address,user_id: user.id, product_id: product.id)
    sleep(1)
end

describe '購入内容確認' do
  context '商品購入がうまくいく時' do

it 'building_nameが空でも保存できること' do
  @order_address.building_name = ''
  expect(@order_address).to be_valid
end

it 'すべての値が正しく入力されていれば保存できること' do
  expect(@order_address).to be_valid
 end
end

context '商品購入がうまくいかない時' do

  it 'post_numberが空だと保存できないこと' do
   @order_address.post_number = ''
   @order_address.valid?
   expect(@order_address.errors.full_messages).to include "Post number can't be blank"
end

it 'cityが空だと保存できないこと' do
  @order_address.city = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "City can't be blank"
end

it 'phone_numberが空だと保存できないこと' do
  @order_address.phone_number = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
end

it 'addressが空だと保存できないこと' do
  @order_address.address = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Address can't be blank"
end

it 'tokenが空だと保存できないこと' do
  @order_address.token = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Token can't be blank"
end

it 'user_idが空だと保存できないこと' do
  @order_address.user_id = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "User can't be blank"
end

it 'product_idが空だと保存できないこと' do
  @order_address.product_id = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Product can't be blank"
end

it 'prefecture_idに1が選択されている場合保存できないこと' do
  @order_address.prefecture_id = 1
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Prefecture must be other than 1"
end

it 'prefecture_idの選択がない場合保存できないこと' do
  @order_address.prefecture_id = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Prefecture is not a number"
end

it 'post_numberにハイフンがないと保存できないこと' do
  @order_address.post_number = '9210000'
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Post number is invalid. Include hyphen(-)"
end

it 'phone_numberは11桁以内でないと保存できないこと' do
  @order_address.phone_number = '080000000000'
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
end

it 'phone_numberは英数字混合だと保存できないこと' do
  @order_address.phone_number = 'a0901122000'
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Phone number is invalid."
end
 end
 end
end