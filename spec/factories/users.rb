FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "sample#{n}@example.com" }
    name { "認証済みユーザー" }
    password { "password" }
    encrypted_password { "password" }

    trait :confirmed do
      after_create { |user| user.confirm! }
    end
  end

  factory :test_user_tanaka, class: 'user' do
    name { "田中 太郎" }
    email { "taro.tanaka@example.com" }
    password { "Adf567" }
    encrypted_password { "Adf567" }
    confirmed_at { Date.today }
  end
end
