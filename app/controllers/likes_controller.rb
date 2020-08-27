class LikesController < ApplicationController
  before_action :set_production


  def create
    like = Like.create(user_id: current_user.id, production_id: @production.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, production_id: @production.id)
    like.delete
  end

  private
  def set_production
    @production = Production.find(params[:production_id])
  end


end

