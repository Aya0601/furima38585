FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa000'}
    password_confirmation {password}
    first_name            {'あ'}
    last_name             {'あ'}
    first_name_kana       {'ア'}
    last_name_kana        {'ア'}
    birth                 {'2000-01-01'}
  end
end