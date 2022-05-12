FactoryBot.define do
  factory :pork do
    name { "テストランドレース" }
    description { "テスト用テキスト：大型で、毛色は白。日本の豚肉の主要な品種。" }
    evolution_level { 20 }
    evolve_into { "テスト中ヨークシャー" }
    photo { ActiveStorage::Blob.create_after_upload!(
      io: File.open('./spec/fixtures/images/TestLandrace.png'), filename: 'TestLandrace.png'
      )
    }
  end
end
