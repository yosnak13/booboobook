FactoryBot.define do
  factory :study_time do
    association :book, factory: :test_book
    user { book.user }
    study_date { '2022-01-04 01:30:09' }
    study_time { 30 }
  end

  factory :two_hour_study, class: 'study_time' do
    association :book, factory: :test_book
    # user { book.user }
    study_date { '2022-01-15 07:30:00' }
    study_time { 120 }
  end
end
