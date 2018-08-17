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
  Item.create!(id: 1, title: "アルバム１", price: "1000", stock: "2", sales_quantity: "20", release_date: "20180701", artist_id: 1, label_id: 1, genre_id: 1)

