# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
   name: 'プリン'
)

Genre.create!(
   name: '焼き菓子'
)

Genre.create!(
   name: 'ケーキ'
)

Item.create!(
  genre_id: 1,
  name: '商品名1',
  introduction: 'おいしいです。おいしいです。おいしいです。おいしいです。おいしいです。',
  price: 1000,
  is_active: true
)

Item.create!(
  genre_id: 2,
  name: '商品名2',
  introduction: 'おいしいです。おいしいです。おいしいです。おいしいです。おいしいです。',
  price: 1500,
  is_active: false
)

Item.create!(
  genre_id: 3,
  name: '商品名3',
  introduction: 'おいしいです。おいしいです。おいしいです。おいしいです。おいしいです。',
  price: 1000,
  is_active: true
)

Item.create!(
  genre_id: 1,
  name: '商品名4',
  introduction: 'おいしいです。おいしいです。おいしいです。おいしいです。おいしいです。',
  price: 1000,
  is_active: true
)

item1 = Item.find(1)
item1.image.attach(io: File.open('./app/assets/images/test1.jpg'), filename: 'test1.jpg')
item2 = Item.find(2)
item2.image.attach(io: File.open('./app/assets/images/test2.jpg'), filename: 'test2.jpg')
item3 = Item.find(3)
item3.image.attach(io: File.open('./app/assets/images/test3.jpg'), filename: 'test3.jpg')
item4 = Item.find(4)
item4.image.attach(io: File.open('./app/assets/images/test4.jpg'), filename: 'test4.jpg')
