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
      evolve_into: '',
      photo: File.open('./app/assets/images/test1.jpg')
    },
    {
      name: '中ヨークシャー',
      description: '中型で、全体におおむね長方形。顔は短く、顔面はしゃくれている。色は白。飼養頭数が少なくなっているが、肉質の優れた品種である。',
      evolution_level: 30,
      evolve_into: '大ヨークシャー',
      photo: File.open('./app/assets/images/test2.jpg')
    },
    {
      name: '大ヨークシャー',
      description: '大型で、体積に富み、全体におおむね長方形。顔は長めで、顔面はわずかにしゃくれている。色は白。主要な雌系品種として飼養頭数も多い。',
      evolution_level: '',
      evolve_into: '',
      photo: File.open('./app/assets/images/test3.jpg')
    },
    {
      name: 'ハンプシャー',
      description: '性質は活発、採食性が強いので放飼に適しています。体質は強健ですが、暑さにやや弱いです。',
      evolution_level: 25,
      evolve_into: '',
      photo: File.open('./app/assets/images/test1.jpg')
    },
    {
      name: 'バークシャー',
      description: '中型で、全体におおむね長方形。顔は長めで、顔面はわずかにしゃくれている。色は黒で、眉間、四肢端及び尾端が白。いわゆる黒豚として肉質の良さが特徴。',
      evolution_level: 25,
      evolve_into: 'デュロック',
      photo: File.open('./app/assets/images/test4.jpg')
    },
    {
      name: 'デュロック',
      description: '大型に近く、全体におおむね弓状。顔は長めで、顔面はわずかにしゃくれ、色は褐色。主要な雄系品種として飼養頭数も多い。',
      evolution_level: '',
      evolve_into: '',
      photo: File.open('./app/assets/images/test5.jpg')
    }
  ]
)
