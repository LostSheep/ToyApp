# freeze_string_literal: true

# Handles user password reset.
class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  # GET /password_reset/new.
  # Display the email form to send a reset password request.
  def new; end

  # POST password_reset.
  # Send change password link to the users email.
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
    end
    flash[:info] = 'Email sent with password rese6t instructions'
    redirect_to Root_url
  end

  # GET password_reset/1.
  # Display reset_password form.
  def edit
  end

  # Patch pasword_reset/1.
  # Patch update user's password.
  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
    elsif @user.update_attributes(user_params)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  # Find user's email.
  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirms a valid user.
  def valid_user
    unless (@user&.activated?) && @user.authenticated(:reset, params[:id])
      redirect_to root_url
    end
  end
end
