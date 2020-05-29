# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bcrypt'

tag = Tag.find_or_create_by(name: "funny")

user = User.create(username: "Albert", email: "acastemoreno@gmail.com", password: "123456", encrypted_password: BCrypt::Password.create("123456"))
user_votator = User.create(username: "Marvin", email: "vot@gmail.com", password: "123456", encrypted_password: BCrypt::Password.create("123456"))


category = Category.find_or_create_by(name: "fun")
category2 = Category.find_or_create_by(name: "codeable")

meme = Meme.find_or_create_by(title: "today1", url_source: "https://www.pittsburghmagazine.com/content/uploads/2020/03/IMG_2013-771x1024.jpg", owner: user, category: category, type: "holi")


Meme.find_or_create_by(title: "amiguito2", url_source: "https://imgs.xkcd.com/comics/mbmbam.png", owner: user, category: category, type: "holi", created_at: "2020-04-20")
other_meme = Meme.find_or_create_by(title: "today2", url_source: "https://e.rpp-noticias.io/normal/2019/08/29/175117_834052.png", owner: user_votator, category: category2, type: "holi")

user.voted_memes << other_meme
user_votator.voted_memes << other_meme

meme.tags << tag

comment = Comment.find_or_create_by(body: "body", user: user, meme: meme)

meme.votators << user_votator

p "tag"
p "--------"
p tag.memes

p "user"
p "--------"
p user.memes
p user.comments
p user.commented_memes
p user.voted_memes

p "category"
p "--------"
p category.memes

p "meme"
p "--------"
p meme.reload
p meme
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

