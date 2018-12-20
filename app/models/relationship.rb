# freeze_string_literal: true

# Relationship model class. A relationship is a users ability
# to follow another user.
class Relationship < ApplicationRecord
  belongs_to :follower,    class_name: 'User'
  belongs_to :followed,    class_name: 'User'
  validates  :follower_id, presence: true
  validates  :followed_id, presence: true
end
