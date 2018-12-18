# frozen_string_literal: true

# Handle hellos and fairwells.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # Render Hello World.
  def hello
    render html: 'hello world'
  end

  # Render Fairwell world.
  def fairwell
    render hrml: 'Fairwell world'
  end
end
