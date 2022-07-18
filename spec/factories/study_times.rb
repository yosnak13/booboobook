FactoryBot.define do
  factory :study_time do
    association :user, factory: :user
    association :book, factory: :test_book
    study_date { '2022-01-04 01:30:00' }
    study_time { 30 }
    created_at { '2022-01-04 02:00:00' }
    updated_at { '2022-01-04 02:00:00' }
  end
end
