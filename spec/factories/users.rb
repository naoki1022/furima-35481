FactoryBot.define do
  factory :user do
    nickname              { '山ちゃん' }
    email                 { Faker::Internet.free_email }
    password              { 'sample123' }
    password_confirmation { 'sample123' }
    family_name           { '山田' }
    family_name_kana      { 'ヤマダ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birthday              { '2020-01-01' }
  end
end
