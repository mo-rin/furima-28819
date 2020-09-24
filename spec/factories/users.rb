FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation { password }
    first_name            { '孝之' }
    last_name             { '阿部' }
    first_name_kana       { 'タカユキ' }
    last_name_kana        { 'アベ' }
    birthday              { '1930-01-01' }
  end
end
