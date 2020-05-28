class User < ApplicationRecord
    has_many :memes, foreign_key: :owner_id
    has_many :comments
    has_many :commented_memes, through: :comments, source: :meme
end
