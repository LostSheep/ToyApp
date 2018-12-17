# frozen_string_literal: true

require 'test_helper'

# Tests the user controller.
class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.password = '123456'
    @user.password_confirmation = '123456'
    @base_title = Constants::PAGE_TITLE
  end

  test 'should succeed get index' do
    get signup_path
    assert_response :success
    assert_select 'title', "Sign up | #{@base_title}"
  end

  test 'should succeed get new' do
    get new_user_path
    assert_response :success
  end

  test 'should succeed create user' do
    assert_difference('User.count') do
      post users_url,
            params:
            {
              user: {
                email:                 'Unique96437632@email.com',
                name:                  @user.name, 
                password:              '123456',
                password_confirmation: '123456'
                }
            }
    end
    assert_redirected_to user_path(User.last)
  end

  test 'should succeed show user' do
    get users_path(@user)
    assert_response :success
  end

  test 'should succeed get edit' do
    get edit_user_path(@user)
    assert_response :success
  end

  test 'should succeed update user' do
    patch user_path(@user),
          params:
          {
            user: {
              email:                 @user.email,
              name:                  @user.name, 
              password:              '123456',
              password_confirmation: '123456'
              }
          }
    assert_redirected_to user_path(@user)
  end

  test 'should succeed destroy user' do
    assert_difference('User.count', -1) do
      delete user_path(@user)
    end
    assert_redirected_to users_url
  end
end
