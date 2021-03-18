require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
end

  describe '商品出品' do
  context '商品出品できる時' do
  it "全ての入力条件を満たしたら保存できること" do
    expect(@product).to be_valid
  end
 end
  context '商品出品できない時' do
  it "nameがない場合は登録できないこと" do
    @product.name = ""
    @product.valid?
    expect(@product.errors.full_messages).to include "Name can't be blank"
  end

  it "descriptionがない場合は登録できないこと" do
    @product.description = ""
    @product.valid?
    expect(@product.errors.full_messages).to include "Description can't be blank"
  end

  it "category_idの選択がない場合は登録できないこと" do
    @product.category_id = ""
    @product.valid?
    expect(@product.errors.full_messages).to include "Category is not a number"
  end

  it "status_idの選択がない場合は登録できないこと" do
    @product.status_id = ""
    @product.valid?
    expect(@product.errors.full_messages).to include "Status is not a number"
  end

  it "shopping_charge_id(送料)の選択がない場合は登録できないこと" do
    @product.shopping_charge_id = ""
    @product.valid?
    expect(@product.errors.full_messages).to include "Shopping charge is not a number"
  end

  it "shopping_area_id(発送元の地域)の選択がない場合は登録できないこと" do
    @product.shopping_area_id = ""
    @product.valid?
    expect(@product.errors.full_messages).to include "Shopping area is not a number"
  end

  it "shopping_date_id(発送までの日数)の選択がない場合は登録できないこと" do
    @product.shopping_date_id = ""
    @product.valid?
    expect(@product.errors.full_messages).to include "Shopping date is not a number"
  end

  it "price(価格)の入力がない場合は登録できないこと" do
    @product.price = ""
    @product.valid?
    expect(@product.errors.full_messages).to include "Price can't be blank"
  end
  
  it "descriptionが1000文字以上であれば登録できないこと " do
    @product.description = "a"*1001
    @product.valid?
    expect(@product.errors.full_messages).to include "Description is too long (maximum is 1000 characters)"
  end

  it "nameが40文字以上であれば登録できないこと " do
    @product.name = "a"*41
    @product.valid?
    expect(@product.errors.full_messages).to include "Name is too long (maximum is 40 characters)"
  end

  it "price(値段)が300以下であれば登録できないこと " do
    @product.price = 200
    @product.valid?
    expect(@product.errors.full_messages).to include "Price must be greater than or equal to 300"
  end

  it "priceは全角数字では登録できないこと" do
    @product.price = "１０００"
    @product.valid?
    expect(@product.errors.full_messages).to include "Price is not a number"
  end

  it "shopping_area_idに1が選択されている場合出品できない" do
   @product.shopping_area_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include "Shopping area must be other than 1"
  end

  it "shooping_date_idに1が選択されている場合出品できない" do
    @product.shopping_date_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include "Shopping date must be other than 1"
  end

  it "shooping_charge_idに1が選択されている場合出品できない" do
    @product.shopping_charge_id = 1
      @product.valid?
       expect(@product.errors.full_messages).to include "Shopping charge must be other than 1"
  end

  it "status_idに1が選択されている場合出品できない" do
    @product.status_id = 1
      @product.valid?
        expect(@product.errors.full_messages).to include "Status must be other than 1"
  end

  it "category_idに1が選択されている場合出品できない" do
      @product.category_id = 1
        @product.valid?
          expect(@product.errors.full_messages).to include "Category must be other than 1"
  end

  it "priceが10_000_000円以上では出品できない" do
    @product.price = 10000000
     @product.valid?
      expect(@product.errors.full_messages).to include "Price must be less than 10000000"
  end

  it "priceが半角英数字混合では出品できない" do
    @product.price = "100a"
     @product.valid?
      expect(@product.errors.full_messages).to include "Price is not a number"
  end

  it "priceが半角英字のみでは出品できない" do
    @product.price = "aaaa"
     @product.valid?
      expect(@product.errors.full_messages).to include "Price is not a number"
  end
 end
 end
end
