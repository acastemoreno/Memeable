class Comment < ApplicationRecord
  ### Associations
  belongs_to :user
  belongs_to :meme

  ### Validations
  validates :body, presence: true
end
