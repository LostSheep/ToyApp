# frozen_string_literal: true

require 'test_helper'

# Test users.
class UserTest < ActiveSupport::TestCase
  # Test validations.

  test 'should succeed empty user name' do
    user = User.new(name: '', email: 'test@email.com')
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end

  test 'should succeed empty user email' do
    user = User.new(name: 'john doe', email: '')
    refute user.valid?, 'user is valid without a email'
    assert_not_nil user.errors[:email], 'no validation error for email present'
  end
  
  test 'sould succeed create valid user' do
    user = User.new(name: 'john doe', email: 'unknown@email.com')
    assert user.valid?
  end
end
