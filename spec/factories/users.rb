FactoryBot.define do
  factory :user do
    nickname              {"ふりま"}
    email                 {"furima@gmail.com"}
    password              {"furima1"}
    password_confirmation {password}
    last_name {"ふりま"}
    first_name {"たろう"}
    last_name_kana {"フリマ"}
    first_name_kana {"タロウ"}
    birthday {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end