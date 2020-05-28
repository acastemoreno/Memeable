class Meme < ApplicationRecord
  self.inheritance_column = :_ # Disable STI
  
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :tags

  has_many :comments
  has_many :commentators, through: :comments, source: :user

  has_and_belongs_to_many :votators, join_table: "user_votes_memes", class_name: "User"
end
