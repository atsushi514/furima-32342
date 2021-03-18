FactoryBot.define do
  factory :product do
    name                 {"名前"}
    description          {"説明"}
    price                {"1000"}
    shopping_charge_id   {"2"}
    shopping_area_id     {"2"}
    shopping_date_id     {"2"}
    category_id          {"2"}
    status_id            {"2"}
    association :user 
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
