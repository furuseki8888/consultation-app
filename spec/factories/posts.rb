FactoryBot.define do

  factory :post do
    title                       {"悩み"}
    content                     {"悩みがあります。"}
    association :user
  end

end