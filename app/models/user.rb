class User < ApplicationRecord
    has_many :memes, foreign_key: :owner_id
end
