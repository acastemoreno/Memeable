class Tag < ApplicationRecord
  ### Associations
  has_and_belongs_to_many :memes

  ### Validations
  validates :name, presence: true, uniqueness: true
end
