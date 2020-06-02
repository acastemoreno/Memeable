class Meme < ApplicationRecord
  self.inheritance_column = :_ # Disable STI
  
  ### Associations
  belongs_to :category
  belongs_to :owner, class_name: 'User', counter_cache: :memes_count
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :commentators, through: :comments, source: :user
  has_and_belongs_to_many :votators,
    join_table: "user_votes_memes",
    class_name: "User",
    after_add: :add_vote,
    after_remove: :remove_vote

  ### Validations
  validates :title, :url_source, presence: true
  validates :title, uniqueness: true

  ##Callback
  private
  def add_vote(votator)
    p "Votator"
    p votator
    self.votes_count += 1
    self.save
  end

  def remove_vote(votator)
    p "Votator"
    p votator
    self.votes_count -= 1
    self.save
  end
end
