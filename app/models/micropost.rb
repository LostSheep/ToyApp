# frozen_string_literal: true

# Validates Micropost
class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: 140 },
                      presence: true
end
