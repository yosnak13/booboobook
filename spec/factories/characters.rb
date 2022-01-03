FactoryBot.define do
  factory :character do
    association :user, factory: :test_user_tanaka
    name { "ランドレース" }
    character_type { 0 }
    level { 1 }
    exp { 0 }
    description { "大型で、毛色は白。日本の豚肉の主要な品種。" }
    photo { File.open('./db/fixtures/Landrace.png') }
  end
end
