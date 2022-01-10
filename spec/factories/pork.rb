FactoryBot.define do
  factory :pork do
    name { "ランドレース" }
    description { "大型で、毛色は白。日本の豚肉の主要な品種。" }
    evolution_level { 20 }
    evolve_into { "中ヨークシャー" }
    photo { File.open('./db/fixtures/Landrace.png') }
  end
end
