# frozen_string_literal: true

require 'test_helper'
require 'constants'

# Test user model.
class UserTest < ActiveSupport::TestCase
  # User tests setup
  def setup
    @user = users(:three)
    @user.password = 'foobar'
    @user.password_confirmation = 'foobar'
  end

  # Test validations. 

  test 'should fail validation with missing name' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'should fail validation when user name is too long' do
    @user.name = 'a' * (Constants::MAX_STRING_LEN_USER_NAME + 1)
    assert_not @user.valid?
  end

  test 'should fail validation when email is too long' do
    @user.email = 'a' * Constants::MAX_STRING_LEN_EMAIL + '@email.com'
    assert_not @user.valid?
  end

  test 'should fail validation with missing email' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'sould succeed Validation' do
    assert @user.valid?
  end

  test 'sould succeed validation of abnormal valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address} should be valid"
    end
  end

  test 'should fail validation when email address is invalid' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'should fail validation when email is not unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'should succeed validation confirming emails saved in lower case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'should fail validation when password is blank but id valid length' do
    @user.password = @user.password_confirmation = 'a' * Constants::MIN_STRING_LEN_PASSWORD
    assert @user.valid?
    @user.password = @user.password_confirmation = ' ' * Constants::MIN_STRING_LEN_PASSWORD
    assert_not @user.valid?
  end

  test 'should fail validation when password is too short' do
    @user.password = @user.password_confirmation = 'a' * (Constants::MIN_STRING_LEN_PASSWORD - 1)
    assert_not @user.valid?
  end
end
