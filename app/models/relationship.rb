class Relationship < ApplicationRecord

  # Validations
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  # Associations
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
