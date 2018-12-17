# frozen_string_literal: true

require 'test_helper'

# Tests static pages controler.
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  # Tests setup.
  def setup
    @base_title = Constants::PAGE_TITLE
  end

  # Test root.

  test 'should succeed get root' do
    get root_path
    assert_response :success
  end

  # Test home.

  test 'should succeed get home' do
    get home_path
    assert_response :success
    assert_select 'title', "Home | #{@base_title}"
  end

  # Test help.

  test 'should succeed get help' do
    get help_path
    assert_response :success
    assert_select 'title', "Help | #{@base_title}"
  end

  # Test about.

  test 'should succeed get about' do
    get about_path
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end

  # Test contact.

  test 'should succeed get contact' do
    get contact_path
    assert_response :success
    assert_select 'title', "Contact | #{@base_title}"
  end
end
