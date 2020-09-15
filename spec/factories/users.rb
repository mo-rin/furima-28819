FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {"aaaa@gmail.com"}
    password              {"aom13680"}
    password_confirmation {password}
    first_name            {"たかユキ"}
    last_name             {"阿部"}
    first_name_kana       {"タカユキ"}
    last_name_kana        {"アベ"}
    birthday              {"1930-01-01"}
  end
end
