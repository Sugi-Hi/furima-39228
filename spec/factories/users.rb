FactoryBot.define do
  factory :f_user, class: User do
    nickname              {Faker::Name.initials(number: 50)}
    email                 {"test.com"} #{Faker::Internet.free_email}
    password              {"test2"} #{Faker::Internet.password(max_length: 5)}
    password_confirmation {password}
    last_name             {''}
    first_name            {''}
    last_name_kana        {'やまだ'}
    first_name_kana       {'たろう'}
    birth_date            {Faker::Date.between(from: 200.years.ago, to: 100.years.ago)}
  end


  factory :t_user, class: User do
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