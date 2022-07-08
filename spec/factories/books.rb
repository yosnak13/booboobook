FactoryBot.define do
  factory :book do
  end

  factory :test_book, class: 'book' do
    association :user, factory: :user
    isbn { "0000000000" }
    book_name { "プログラムの本 その1" }
    total_read_time { 0 }
    status { 0 }
    memo { "最初に登録して1時間よみます" }
  end

  factory :user_is_reading_book, class: "book" do
    association :user, factory: :user
    isbn { "0000000000" }
    book_name { "プログラムの本 その2" }
    total_read_time { 30 }
    status { 1 }
    memo { "読書中です" }
  end
end
