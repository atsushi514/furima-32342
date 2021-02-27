FactoryBot.define do
  factory :user do
    nickname              {"太郎"}
    email                 {"sample9@email.com"}
    password              {"aaa000"}
    password_confirmation {"aaa000"}
    first_name            {"阿部"}
    family_name           {"太郎"}
    first_name_kana       {"アベ"}
    family_name_kana      {"タロウ"}
    birth_day            {"1995-10-12"}
  end
end