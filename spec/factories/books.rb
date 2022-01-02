FactoryBot.define do
  factory :book do
  end

  factory :test_book, class: 'book' do
    association :user, factory: :test_user_tanaka
    isbn { "0000000000" }
    book_name { "プログラムの本 その1" }
    total_read_time { 0 }
    status { 0 }
    memo { "最初に登録して1時間よみます" }
  end
end
