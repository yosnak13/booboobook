FactoryBot.define do
  factory :study_time do
    association :book, factory: :test_book
    study_date { '2022-01-04 01:30:09' }
    study_time { 30 }
  end
end
