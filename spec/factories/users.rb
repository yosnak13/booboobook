FactoryBot.define do
  factory :user do
  end

  factory :test_user_tanaka, class: 'user' do
    name { "田中 太郎" }
    email { "taro.tanaka@example.com" }
    password { "Adf567" }
    encrypted_password { "Adf567" }
  end
end
