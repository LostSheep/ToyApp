# frozen_string_literal: true

# Handles static page for home, help, about and contact.
class StaticPagesController < ApplicationController
  # GET static_pages/home.
  # Display home page.
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  # GET /static_pages/help.
  # Display help page.
  def help; end

  # GET /static_pages/about.
  # Display about page.
  def about; end

  # GET /static_pages/contact.
  # Display contact page.
  def contact; end
end
