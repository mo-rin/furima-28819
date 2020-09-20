FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { 'Faker::Internet.free_email' }
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation { password }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    first_name_kana       { 'タカユキ' }
    last_name_kana        { 'アベ' }
    birthday              { '1930-01-01' }
  end
end
