# frozen_string_literal: true

# Handle micropost CRUD.
class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]

  # GET /microposts.
  # List microposts.
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/new.
  # Display micropost create UI.
  def new
    @micropost = Micropost.new
  end

  # POST /microposts.
  # Create new micropost.
  def create
    @micropost = Micropost.new(micropost_params)
    respond_to do |format|
      if @micropost.save
        format.html do
          redirect_to @micropost,
                      notice: 'Micropost was successfully created.'
        end
        format.json do
          render :show, status: :created, location: @micropost
        end
      else
        format.html { render :new }
        format.json do
          render json: @micropost.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /microposts/1.
  # Update micropost.
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html do
          redirect_to @micropost, notice: 'Micropost was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json do
          render json: @micropost.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /microposts/1.
  # DELETE micropost.
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html do
        redirect_to microposts_url,
                    notice: 'Micropost was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end
end
