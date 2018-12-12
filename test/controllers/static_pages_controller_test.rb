# frozen_string_literal: true

require 'test_helper'

# Tests static pages controler.
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  # Test setup
  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  # Test index
  test 'should succeed get root' do
    get root_path
    assert_response :success
  end

  test 'should succeed get home' do
    get static_pages_home_path
    assert_response :success
    assert_select 'title', "Home | #{@base_title}"
  end

  test 'should succeed get help' do
    get static_pages_help_path
    assert_response :success
    assert_select 'title', "Help | #{@base_title}"
  end

  test 'should succeed get about' do
    get static_pages_about_path
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end
end
