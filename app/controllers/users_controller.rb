class UsersController < ApplicationController

  def index 
    @likes = Like.where(user_id: current_user.id) 
  end

  def show
    @card = current_user.card
    @productions = current_user.productions.order('created_at DESC').limit(8)
  end
end

