class Comment < ApplicationRecord
  ### Associations
  belongs_to :user
  belongs_to :meme, counter_cache: :comments_count

  ### Validations
  validates :body, presence: true
end
