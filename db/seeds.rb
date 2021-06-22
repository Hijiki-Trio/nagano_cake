# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'test@test.com',
  password: 'testtest'
)

Genre.create!(
  name: 'ケーキ'
)

Genre.create!(
  name: 'ホールケーキ'
)

Genre.create!(
  name: 'ロールケーキ'
)

Genre.create!(
  name: '焼き菓子'
)

Genre.create!(
  name: 'チョコレート'
)

Product.create!(
  genre_id: 1,
  name: 'ショートケーキ',
  detail: '程良い甘さの生クリームと苺をふんだんに使っています。',
  price: '450',
  image: open("./app/assets/images/products/shortcake.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 1,
  name: 'チーズケーキ',
  detail: 'しっかり冷やすとさらに美味しく、しっとり濃厚な味わいです。',
  price: '350',
  image: open("./app/assets/images/products/cheesecake.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 1,
  name: 'チョコレートケーキ',
  detail: 'チョコレートスポンジを更にビターチョコレートでコーティングしました。',
  price: '370',
  image: open("./app/assets/images/products/chocolatecake.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 1,
  name: 'モンブラン',
  detail: '口溶けの良いマロンクリームに、大きな栗を乗せました。',
  price: '400',
  image: open("./app/assets/images/products/montblanc.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 1,
  name: 'シュークリーム',
  detail: '濃厚なクリームがたっぷり詰まったシュークリームです。',
  price: '250',
  image: open("./app/assets/images/products/creampuff.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 2,
  name: 'バナナケーキ',
  detail: 'しっとりとした生地とバナナの甘みが引き立つケーキです。',
  price: '1100',
  image: open("./app/assets/images/products/bananacake.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 2,
  name: 'ベリータルト',
  detail: '3種類のベリーを使用し、土台はカスタードとタルトで仕上げました。',
  price: '1200',
  image: open("./app/assets/images/products/berrytart.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 2,
  name: 'マスカットレアチーズケーキ',
  detail: 'みずみずしいマスカットをふんだんに使用したレアチーズケーキです。',
  price: '1500',
  image: open("./app/assets/images/products/cheesemuscat.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 2,
  name: 'フルーツタルト',
  detail: '彩り鮮やかなフルーツをたくさん飾り付けました。',
  price: '1600',
  image: open("./app/assets/images/products/fruittart.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 3,
  name: 'ロールケーキ',
  detail: 'ふわふわの生地に生クリームがたっぷり入った定番のロールケーキです。',
  price: '1000',
  image: open("./app/assets/images/products/rollcake.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 3,
  name: 'アーモンドパウンドケーキ',
  detail: 'アーモンドをたっぷりと使用したパウンドケーキです。',
  price: '1200',
  image: open("./app/assets/images/products/poundcake.webp"),
  is_active: true
)

Product.create!(
  genre_id: 3,
  name: 'ベジタブルパウンドケーキ',
  detail: '小松菜を使用しており、野菜嫌いなお子様も食べやすいケーキです。',
  price: '1200',
  image: open("./app/assets/images/products/vagepoundcake.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 4,
  name: 'チョコチップクッキー',
  detail: '大きなチョコチップがたくさん入ったクッキー5枚入りです。',
  price: '400',
  image: open("./app/assets/images/products/cookie.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 4,
  name: 'マカロン',
  detail: 'チョコレートと抹茶の2種類セットです。',
  price: '350',
  image: open("./app/assets/images/products/macaron.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 4,
  name: 'スイートポテト',
  detail: '甘さ控えめなしっとり濃厚なスイートポテト2個入りです。',
  price: '350',
  image: open("./app/assets/images/products/sweetpotato.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 4,
  name: 'ドーナッツ',
  detail: 'しっとりした生地のプレーンドーナッツ2個入りです。',
  price: '300',
  image: open("./app/assets/images/products/donuts.webp"),
  is_active: true
)

Product.create!(
  genre_id: 5,
  name: 'チョコレート',
  detail: 'アーモンドやガナッシュなど12種類のチョコレート詰め合わせです。',
  price: '3000',
  image: open("./app/assets/images/products/chocolate.webp"),
  is_active: true
)

Product.create!(
  genre_id: 3,
  name: '抹茶ロールケーキ',
  detail: '生地にほんのり香る抹茶を仕込みました。',
  price: '1200',
  image: open("./app/assets/images/products/macharoll.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 1,
  name: 'ザッハトルテ',
  detail: '濃厚なチョコレートとしっとり口溶け滑らかなケーキです。',
  price: '400',
  image: open("./app/assets/images/products/sachertorte.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 5,
  name: 'チョコレート',
  detail: 'アーモンドやガナッシュなど12種類のチョコレート詰め合わせです。',
  price: '3000',
  image: open("./app/assets/images/products/chocolate.webp"),
  is_active: true
)

Product.create!(
  genre_id: 1,
  name: 'ブルーベリータルト',
  detail: 'タルト生地にブルーベリーとラズベリーを飾りました。',
  price: '400',
  image: open("./app/assets/images/products/berrytart.jpg"),
  is_active: true
)

Product.create!(
  genre_id: 2,
  name: 'ストロベリータルト',
  detail: '大きな苺をたっぷりのせたタルトです。',
  price: '1500',
  image: open("./app/assets/images/products/strawberrytart.jpg"),
  is_active: true
)
