# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Artist.create!(id: 1, name: "安室")
  Label.create!(id: 1, name: "エイベックス")
  Genre.create!(id: 1, name: "洋楽")

  Artist.create!(id: 2, name: "木村")
  Genre.create!(id: 2, name: "邦楽")
  Label.create!(id: 2, name: "ポニーキャニオン")

  Artist.create!(id: 3, name: "Big")
  Genre.create!(id: 3, name: "韓楽")
  Label.create!(id: 3, name: "チャーリー・レコード")

  Artist.create!(id: 4, name: "cla")
  Genre.create!(id: 4, name: "jaz")
  Label.create!(id: 4, name: "スタジオ・ワン・レコード")



  Item.create!(id: 1, title: "ソング", price: "1000", stock: "2", sales_quantity: "20", release_date: "20180701", artist_id: 1, label_id: 1, genre_id: 1)

  Item.create!(id: 2, title: "ソナタ", price: "2000", stock: "2", sales_quantity: "20", release_date: "20180501", artist_id: 2, label_id: 2, genre_id: 2)

  Item.create!(id: 3, title: "ソノア", price: "3000", stock: "2", sales_quantity: "20", release_date: "20180302", artist_id: 3, label_id: 3, genre_id: 3)

  Item.create!(id: 4, title: "ソノチ", price: "4000", stock: "2", sales_quantity: "20", release_date: "20180401", artist_id: 4, label_id: 4, genre_id: 4)