class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like

  # def index
  #   @user = current_user
  #   # @likes = Likes.where(user_id: @user.id).all
  # end

  def create
    @user = current_user
    @production = Production.find(params[:production_id])
    @like = Like.create(user_id: @user.id, production_id: @production.id)
  end

  def destroy
    @user = current_user
    @production = Production.find(params[:production_id])
    like = Like.find_by(user_id: @user.id, production_id: @production.id)
    like.delete
  end

  private
  def set_like
    @production = Production.find(params[:production_id])
  end
end

