FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'test123' }
    password_confirmation { password }
    last_name             { 'てすと' }
    first_name            { 'てすと' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    birth_date            { '2020/01/01' }
  end
end
