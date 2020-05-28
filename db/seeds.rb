# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tag = Tag.create(name: "funny")

user = User.create(username: "Holi", email: "holi")
user_votator = User.create(username: "Votator", email: "vot")

category = Category.create(name: "holi")

meme = Meme.create(title: "amiguito", source: "asd", owner: user, category: category, type: "holi")

comment = Comment.create(body: "body", user: user, meme: meme)

meme.votators << user_votator

p "tag"
p "--------"
p tag.memes

p "user"
p "--------"
p user.memes
p user.comments
p user.commented_memes
user.voted_memes

p "category"
p "--------"
p category.memes

p "meme"
p "--------"
p meme.category
p meme.owner
p meme.tags
p meme.comments
p meme.commentators
p meme.votators

p "comment"
p "--------"
p comment.user
p comment.meme

