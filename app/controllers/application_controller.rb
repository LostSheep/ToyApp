# frozen_string_literal: true

# Handle hellos and fairwells.
class ApplicationController < ActionController::Base
  # Render Hello World.
  def hello
    render html: 'hello world'
  end

  # Render Fairwell world.
  def fairwell
    render hrml: 'Fairwell world'
  end
end
