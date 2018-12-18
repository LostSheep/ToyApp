# frozen_string_literal: true

require 'constants'

# Validates User
class User < ApplicationRecord
  attr_accessor :remember_token
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

  class << self
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MINCOST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given toek nmatches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end
end
