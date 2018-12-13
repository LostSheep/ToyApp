# frozen_string_literal: true

require 'test_helper'

# Test user model.
class UserTest < ActiveSupport::TestCase
  # User testss setup
  def setup
    @user = User.new(name: 'test User_name',
                     email: 'test@email.com',
                     password: 'foobar',
                     password_confirmation: 'foobar')
  end

  # Test new user

  test 'should succeed name sould be pressent' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'name should succeed not be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should succeed not be too long' do
    @user.email = 'a' * 244 + '@email.com'
    assert_not @user.valid?
  end

  test 'should succeed user email sould be pressent' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'sould succeed create valid user' do
    assert @user.valid?
  end

  test 'sould succeed accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address} should be valid"
    end
  end

  test 'should succeed reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'should succeed reject non-unique email' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'should succeed emails saved as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'should succeed reject non-blank password' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'should succeed password min length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
