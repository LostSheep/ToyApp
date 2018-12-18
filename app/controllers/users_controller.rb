# frozen_string_literal: true

# Handle user CRUD.
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users.
  # List Users.
  def index
    @users = User.all
  end

  # Show /user/1.
  # Display user info. 
  def show
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to home_path
    end
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
byebug
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = 'Welcome to the Sample App!'
        format.html do
          redirect_to @user, notice: 'User was successfully created.'
        end
        format.json do
          render :show, status: :created, location: @user
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1.
  # Update user.
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to @user,
                      notice: 'User was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json do
          render json: @user.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /users/1.
  # Destroy user.
  def destroy
    @user.destroy
    respond_to do |format|
      format.html do
        redirect_to users_url,
                    notice: 'User was successfully destroyed.'
      end
      format.json { head :no_content }
    end
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
end
