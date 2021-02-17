# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


gabe = User.create(name: "gabe", age: 23, username: "gabed", password: "abc123")
cade = User.create(name: "cade", age: 22, username: "cadet", password: "abc123")
aaron = User.create(name: "aaron", age: 31, username: "aaronm", password: "abc123")

#booksshop1 = Bookshop.create(name: "BS1")
#bookshop2 = Bookshop.create(name: "BS2")

gc = Friendship.create(friender_id: 1, friendee_id:2)
ga = Friendship.create(friender_id: 1, friendee_id:3)