require 'test_helper'

# Test sessions controller.
class SessionsControllerTest < ActionDispatch::IntegrationTest
  # Setup for sessions tests.
  setup do
  end

  # Test Login

  test "should succeed get new" do
    get login_path
    assert_response :success
  end

end
