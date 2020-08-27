class LikesController < ApplicationController
  before_action :set_production


  def create
    @user = current_user
    @like = Like.create(user_id: @user.id, production_id: @production.id)
  end

  def destroy
    @user = current_user
    like = Like.find_by(user_id: @user.id, production_id: @production.id)
    like.delete
  end

  private
  def set_production
    @production = Production.find(params[:production_id])
  end


end

