FactoryBot.define do

  factory :profile do
    nickname                       {"itiro"}
    prefecture_id                  {"13"}
    introduction                   {"よろしくお願いします。"}
    image                          { File.open("#{Rails.root}/spec/fixtures/test.png") }
    association :user
  end

end