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
      photo: File.open('./app/assets/images/test1.jpg')
    },
    {
      name: '大ヨークシャー',
      description: '発育も早く、純粋種としてはランドレース種についで多数飼育されています。',
      evolution_level: 30,
      photo: File.open('./app/assets/images/test2.jpg')
    },
    {
      name: 'ハンプシャー',
      description: '性質は活発、採食性が強いので放飼に適しています。体質は強健ですが、暑さにやや弱いです。',
      evolution_level: 25,
      photo: File.open('./app/assets/images/test3.jpg')
    }
  ]
)
