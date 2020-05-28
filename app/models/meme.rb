class Meme < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :tags

  has_many :comments
  has_many :commentators, through: :comments, source: :user
end
