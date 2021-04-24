FactoryBot.define do
  factory :order_address do
    post_number { "123-4567" }
    prefecture_id { 2 }
    city { "金沢" }
    address { "1-1" }
    building_name { "石川ハイツ" }
    phone_number {"08011110000"}
    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    product_id {1}
  end
end
