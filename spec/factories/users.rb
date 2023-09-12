FactoryBot.define do
  factory :user do
    # nickname              {Faker::Name.name}
    # email                 {Faker::Internet.free_email}
    # password              {Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
    # last_name             {'山田'}
    # first_name            {'太郎'}
    # last_name_kana        {'ヤマダ'}
    # first_name_kana       {'タロウ'}
    # birth_date            {Faker::Date.between(from: 93.years.ago, to: 5.years.ago)}


    nickname              {"フリマ"}
    email                 {"test@test.com"}
    password              {"test23"}
    password_confirmation {password}
    last_name             {'a'}
    first_name            {'b'}
    last_name_kana        {'エ'}
    first_name_kana       {'ビ'}
    birth_date            {"2010-12-17"}

  end
end