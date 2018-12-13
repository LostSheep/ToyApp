# frozen_string_literal: true

require 'test_helper'

# Tests the user controll:er.
class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  # Test index.

  test 'should succeed get index' do
    get users_url
    assert_response :success
  end

  # Test new.

  test 'should succeed get new' do
    get new_user_url
    assert_response :success
  end

  # Test create.

  test 'should succeed create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, name: @user.name } }
    end
    assert_redirected_to user_url(User.last)
  end

  # Test show.

  test 'should succeed show user' do
    get user_url(@user)
    assert_response :success
  end

  # Test edit.

  test 'should succeed get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  # Test update.

  test 'should succeed patch update user' do
    patch user_url(@user),
          params: { user: { email: @user.email, name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  # Test destroy.

  test 'should succeed delete destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end
end
