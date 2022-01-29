FactoryBot.define do
  factory :pork do
    id { 1 }
    name { "ランドレース" }
    description { "大型で、毛色は白。日本の豚肉の主要な品種。" }
    evolution_level { 20 }
    evolve_into { "中ヨークシャー" }
    photo { ActiveStorage::Blob.create_after_upload!(
      io: File.open('./spec/fixtures/images/TestLandrace.png'), filename: 'TestLandrace.png'
      )
    }
  end
end
