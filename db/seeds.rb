# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pork.create!(
  [
    {
      name: 'ランドレース',
      description: '大型で、毛色は白。日本の豚肉の主要な品種。',
      evolution_level: 20,
      evolve_into: '中ヨークシャー',
      photo: ActiveStorage::Blob.create_after_upload!(io: File.open('./db/fixtures/Landrace.png'), filename: 'Landrace.png')
    },
    {
      name: '中ヨークシャー',
      description: '中型で、全体におおむね長方形。顔は短く、顔面はしゃくれている。色は白。飼養頭数が少なくなっているが、肉質の優れた品種である。',
      evolution_level: 30,
      evolve_into: '大ヨークシャー',
      photo: ActiveStorage::Blob.create_after_upload!(io: File.open('./db/fixtures/Yorkshire.png'), filename: 'Yorkshire.png')
    },
    {
      name: '大ヨークシャー',
      description: '大型で、体積に富み、全体におおむね長方形。顔は長めで、顔面はわずかにしゃくれている。色は白。主要な雌系品種として飼養頭数も多い。',
      evolution_level: '',
      evolve_into: '',
      photo: ActiveStorage::Blob.create_after_upload!(io: File.open('./db/fixtures/Yorkshire.png'), filename: 'Yorkshire.png')
    },
    {
      name: 'もち豚',
      description: 'もち豚は、東北の「みちのくもち豚」、宮城の「仙南もち豚」、新潟県の「越後もち豚」、福岡・熊本の「はかたもち豚」など、日本各地で独自の名前を付けて飼育されています。',
      evolution_level: 30,
      evolve_into: 'アグー豚',
      photo: ActiveStorage::Blob.create_after_upload!(io: File.open('./db/fixtures/Mochi.png'), filename: 'Mochi.png')
    },
    {
      name: 'アグー豚',
      description: 'アグー豚は昔から沖縄で飼われてきた在来豚で、黒色の見た目で、毛深くクセのある長い毛と、西洋豚と比べて小型であることが特徴です。',
      evolution_level: '',
      evolve_into: '',
      photo: ActiveStorage::Blob.create_after_upload!(io: File.open('./db/fixtures/Agu.png'), filename: 'Agu.png')
    }
  ]
)

Admin.create!(
  email: ENV['ADMIN_MAIL'],
  password: ENV['ADMIN_PASSWORD']
)

require "csv"
CSV.foreach('db/bbb_thresold.csv', headers: true) do |row|
  LevelSetting.create(
    level: row[0],
    thresold: row[1],
    needed_exp: row[2]
  )
end
