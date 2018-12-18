# frozen_string_literal: true

# Hanldes login.
class SessionsController < ApplicationController
  # GET /login.
  # Display login page.
  def new; end

  # Post /login
  # Attemp login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash[:danger] = 'Invalid email or password.'
      render 'new'
    end
  end

  # DELETE /login
  # Logout.
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
