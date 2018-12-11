require 'test_helper'

# Tests static pages controler.
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  # Test setup
  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end
  
  # Test index
  test "should succeed get root" do
    get root_path
    assert_response :success
  end
  
  test 'should succeed get home' do
    get home_path
    assert_response :success
    assert_select 'title', "Home | #{@base_title}"
  end

  test 'should succeed get help' do
    get help_path
    assert_response :success
    assert_select 'title', "Help | #{@base_title}"
  end
  
  test 'should succeed get about' do
    get about_path
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end

  test 'should succeed get contact' do
    get contact_path
    assert_response :success
    assert_select 'title', "Contact | #{@base_title}"
  end
end
