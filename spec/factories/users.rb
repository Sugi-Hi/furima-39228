FactoryBot.define do
  factory :f_user, class: User do
    nickname              {Faker::Name.initials(number: 50)}
    email                 {"test.com"} #{Faker::Internet.free_email}
    password              {"test1"} #{Faker::Internet.password(max_length: 5)}
    password_confirmation {password}
    last_name             {'!'}
    first_name            {'1b'}
    last_name_kana        {'やまだ'}
    first_name_kana       {'太郎'}
    birth_date            {Faker::Date.between(from: 200.years.ago, to: 100.years.ago)}
  end


  factory :user, class: User do
    nickname              {"フリマ"}
    email                 {"test@test.com"}
    password              {"test23"}
    password_confirmation {password}
    last_name             {'え'}
    first_name            {'び'}
    last_name_kana        {'エ'}
    first_name_kana       {'ビ'}
    birth_date            {"2010-12-17"}
  end

end