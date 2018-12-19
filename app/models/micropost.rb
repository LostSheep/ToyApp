# frozen_string_literal: true

require 'constants'

# Validates Micropost
class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, length: { maximum: Constants::MAX_STRING_LEN_MICROPOST },
                      presence: true
  validate :picture_size

  private

  #Validate the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      error.add(:picture, 'should be less that 5MB')
    end
  end
end
