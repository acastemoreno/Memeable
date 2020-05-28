class Category < ApplicationRecord
  ### Associations
  has_many :memes

  ### Validations
  validates :name, presence: true, uniqueness: true
end
