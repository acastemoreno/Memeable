class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ### Associations
  has_many :memes, foreign_key: :owner_id
  has_many :comments
  has_many :commented_memes, through: :comments, source: :meme
  has_and_belongs_to_many :voted_memes, join_table: "user_votes_memes", class_name: "Meme"

  ### Validations
  validates :username, :email, presence: true, uniqueness: true
end
