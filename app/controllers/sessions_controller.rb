# freeze_string_literal: true

# Hanldes login.
class SessionsController < ApplicationController
  # GET /login.
  # Display login page.
  def new
  end

  # Post /login
  # Attemp login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email or password.'
      render 'new'
    end
  end

  # DELETE /login
  # Logout.
  def destroy
    log_out
    redirect_to root_url
  end
end
