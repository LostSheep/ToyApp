# frozen_string_literal: true

require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
    @user = users(:one)
  end

  # Test index.

  test 'should succeed get index' do
    get microposts_path
    assert_response :success
  end

  test 'should succeed get new' do
    get new_micropost_path
    assert_response :success
  end

  # Test create.

  test 'should succeed post create microtest' do
    # assert_difference('Micropost.count', 1) do
      post microposts_path, params: { micropost: { content: @micropost.content, user_id: @user.id } }
    # end
    assert_redirected_to micropost_path(Micropost.last)
  end

  # Test update.

  test 'should succeed patch update micropost' do
    
    patch micropost_path(@micropost), params: 
    { 
      micropost: 
      { 
        content: @micropost.content, 
        user_id: @micropost.user_id
      }, format: :html
    }
    assert_redirected_to micropost_path(@micropost)
  end

  # Test destroy.

  test 'should succeed delete destroy micropost' do
    assert_difference('Micropost.count', -1) do
      delete micropost_path(@micropost)
    end

    assert_redirected_to microposts_path
  end
end
