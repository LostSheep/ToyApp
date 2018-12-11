# frozen_string_literal: true

require 'constants'

# Validates Micropost
class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: Constants::MICROPOST_MAX_STRING_LEN },
                      presence: true
end
