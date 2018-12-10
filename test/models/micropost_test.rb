# frozen_string_literal: true

require 'test_helper'

# Micropost model test class. 
class MicropostTest < ActiveSupport::TestCase
    
    # Setup for tests.
    def setup
       @user = users(:one)
    end
    
    test 'should succeed empty micropost content' do
        micropost = Micropost.new(content: '', user: @user)
        refute micropost.valid?, 'micropost is valid without content'
        assert_not_nil micropost.errors[:content], 
        'no validation error for empty content'
    end
    
    test 'should succeed micropost content exceed max' do
        micropost = Micropost.new(content: 't'*141, user: @user)
        refute micropost.valid?, 'micropost is valid without content'
        assert_not_nil micropost.errors[:content], 
        'no validation error for empty content'
    end
    
    test 'should succeed micropost with invalid user' do
        micropost = Micropost.new(content: 'small post', user: nil)
        refute micropost.valid?, 'user is valid without a email'
        assert_not_nil micropost.errors[:user], 'no validation error for email present'
    end
    
    test 'sould succeed create valid micropost' do
        micropost = Micropost.new(content: 'micropost', user: @user)
        assert micropost.valid?
    end
    
    test 'sould succeed create valid micropost with max content' do
        micropost = Micropost.new(content: 't' * 140, user: @user)
        assert micropost.valid?
    end
end
