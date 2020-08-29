FactoryBot.define do

  factory :comment do
    content                     {"共感します。"}
    association :user
    association :post
  end

end