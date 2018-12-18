# frozen_string_literal: true

# Handle user CRUD.
class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update]
  before_action :correct_user,   only: %i[edit update]
  before_action :admin_user,     only:   :destroy

  # GET /users.
  # List Users.
  def index
    @users = User.paginate(page: params[:page])
  end

  # Show /user/1.
  # Display user info.
  def show
    @user = User.where(activated: true).fine(params[:id])
    redirect_to root_path and return unless !@user.nil?
    @user
  end

  # GET /users/new.
  # Display new users UI.
  def new
    @user = User.new
  end

  # POST /users.
  # Create new user.
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @user.send_activation_email
        flash[:info] = 'Please check your email to activate yor account.'
        redirect_to root_url
      else
        render 'new'
      end
    end
  end

  # PATCH/PUT /users/1.
  # Update user.
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1.
  # Destroy user.
  def destroy
    user = User.find_by(params[:id]).destroy
    flash[:success] = 'User deleted.'
    redirect_to users_url
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet,
    # only allow the white list through.
    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end

    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
