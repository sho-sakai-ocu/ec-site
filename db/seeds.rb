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

Customer.create!(
  last_name: "山田",
  first_name: "太郎",
  last_name_kana: "yamada",
  first_name_kana: "taro",
  email: "b@b",
  password: "aaaaaa",
  postal_code: "1234567",
  address: "東京都新宿区○○○○",
  telephone_number: "123456789",
  is_deleted: false
)

Address.create!(
  customer_id: 1,
  name: "鈴木太郎",
  postal_code: "7654321",
  address: "大阪府大阪市北区○○○○"
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
  name: 'イチゴケーキ',
  introduction: 'おいしいです。おいしいです。おいしいです。おいしいです。おいしいです。',
  price: 600,
  is_active: true
)

Item.create!(
  genre_id: 2,
  name: 'フルーツタルト',
  introduction: 'おいしいです。おいしいです。おいしいです。おいしいです。おいしいです。',
  price: 800,
  is_active: true
)

Item.create!(
  genre_id: 3,
  name: 'モンブラン',
  introduction: 'おいしいです。おいしいです。おいしいです。おいしいです。おいしいです。',
  price: 1000,
  is_active: true
)

Item.create!(
  genre_id: 1,
  name: 'チョコケーキ',
  introduction: 'おいしいです。おいしいです。おいしいです。おいしいです。おいしいです。',
  price: 1200,
  is_active: true
)

item1 = Item.find(1)
item1.image.attach(io: File.open('./app/assets/images/strawberry_cake.jpg'), filename: 'test1.jpg')
item2 = Item.find(2)
item2.image.attach(io: File.open('./app/assets/images/fruit_tart.jpg'), filename: 'test2.jpg')
item3 = Item.find(3)
item3.image.attach(io: File.open('./app/assets/images/mont_blanc_cake.jpg'), filename: 'test3.jpg')
item4 = Item.find(4)
item4.image.attach(io: File.open('./app/assets/images/chocolate_cake.jpg'), filename: 'test4.jpg')
