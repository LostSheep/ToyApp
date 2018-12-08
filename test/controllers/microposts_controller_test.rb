# frozen_string_literal: true

require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
    @user = user(:one)
  end
  
  # Test index

  test 'should succeed get index' do
    get microposts_url
    assert_response :success
  end

  test 'should succeed get new' do
    get new_micropost_url
    assert_response :success
  end

# Test create

  test 'should succeed post create microtest' do
    assert_difference('Micropost.count', 1) do
      post microposts_url, params: { micropost: { content: @micropost.content, user: @user } }
    end
    assert_redirected_to micropost_url(Micropost.last)
  end

  # Test Update

  test 'should succeed update micropost' do
    patch micropost_url(@micropost), params: 
    { 
      micropost: 
      { content: @micropost.content, 
      user_id: @micropost.user_id
      }
    }
    assert_redirected_to micropost_url(@micropost)
  end

  # Test Delete

  test 'should succeed destroy micropost' do
    assert_difference('Micropost.count', -1) do
      delete micropost_url(@micropost)
    end

    assert_redirected_to microposts_url
  end
end
