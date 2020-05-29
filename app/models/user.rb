class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable, :recoverable
  ### Associations
  has_many :memes, foreign_key: :owner_id
  has_many :comments
  has_many :commented_memes, through: :comments, source: :meme
  has_and_belongs_to_many :voted_memes,
    join_table: "user_votes_memes",
    class_name: "Meme",
    after_add: :add_vote,
    after_remove: :remove_vote

  ### Validations
  validates :username, :email, presence: true, uniqueness: true

  ##Callback
  private
  def add_vote(voted_meme)
    p "Voted meme"
    p voted_meme
    voted_meme.votes_count += 1
    voted_meme.save
  end

  def remove_vote(voted_meme)
    p "Votator"
    p voted_meme
    voted_meme.votes_count -= 1
    voted_meme.save
  end
end
