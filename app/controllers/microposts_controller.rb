# frozen_string_literal: true

# Handle micropost CRUD.
class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  # POST micropost/.
  # Create a micropost.
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  # DELETE micropost/1.
  # Destroy micropost.
  def destroy
    @micropost.destroy
    flash[:success] = 'Micropost deleted'
    redirect_to request.referrer || root_url 
  end

  private

  # Require micropost to have content.
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  # Returns true if the current_user owns the micropost. 
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
