# frozen_string_literal: true

# Handle user CRUD.
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users.
  # List Users.
  def index
    @users = User.all
  end

  # GET

  # Display new users UI.
  def new
    @user = User.new
  end

  # POST

  # Create new user.
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
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

  # PATCH/PUT

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

  # DELETE

  # DELETE user.
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
    params.require(:user).permit(:name, :email)
  end
end
