# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tag = Tag.create(name: "funny")
p tag.errors
user = User.create(username: "Holi", email: "holi")
p user.errors
category = Category.create(name: "holi")
p category.errors
meme = Meme.create(title: "amiguito", source: "asd", owner: user, category: category)
p meme.errors