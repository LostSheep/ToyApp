# freeze_string_literal: true

# Define some helpers for session
module SessionsHelper
  # Sets the user session.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Get current session user.
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returens true if hte user is logged in, otherwise false
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @Current_user = nil
  end
end
