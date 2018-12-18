# frozen_string_literal: true

require 'constants'

# Validates User
class User < ApplicationRecord
  has_many :microposts
  before_save { self.email = email.downcase }
  validates :name,
            length: { maximum: Constants::MAX_STRING_LEN_USER_NAME },
            presence: true
  validates :email,
            length: { maximum: Constants::MAX_STRING_LEN_USER_NAME },
            format: { with: Constants::REGEX_EMAIL },
            uniqueness: { case_sensitive: false },
            presence: true
  has_secure_password
  validates :password,
            presence: true,
            length: { minimum: Constants::MIN_STRING_LEN_PASSWORD }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = activeModel::SecurePassword.min_cost ? BCrypt::Engine::MINCOST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string,cost: cost)
  end
end
