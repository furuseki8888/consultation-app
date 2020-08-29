FactoryBot.define do

  factory :user do
    last_name             {"木村"}
    first_name            {"一郎"}
    last_name_kana        {"きむら"}
    first_name_kana       {"いちろう"}
    email                 {"kkk@gmail.com"}
    password              {"000000"}
    password_confirmation {"000000"}
  end

end