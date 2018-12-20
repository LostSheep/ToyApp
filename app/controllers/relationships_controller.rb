# freeze_string_literal: true

# Relationships controller class.
class RelationshipsController < ApplicationController
  before_action :logged_in_user

  # POST /relationships.
  # Build a relationship between users.
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
      respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  # DELETE /relationships/1.
  # Destroy relationship between users.
  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end 
  end
end
