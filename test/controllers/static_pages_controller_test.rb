require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  # Test setup
  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end
  
  # Test index
  
  test "should get root" do
    get FILL_IN
    assert_response FILL_IN
  end
  
  test 'should succeed get home' do
    get static_pages_home_url
    assert_response :success
    assert_select 'title', "Home | #{@base_title}"
  end

  test 'should succeed get help' do
    get static_pages_help_url
    assert_response :success
    assert_select 'title', "Help | #{@base_title}"
  end
  
  test 'should succeed get about' do
    get static_pages_about_url
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end
end
