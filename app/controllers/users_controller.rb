class UsersController < ApplicationController

  def index 
    @user = current_user
    @likes = Like.where(user_id: @user.id) #@user.likes
  end

  def show
    @card = current_user.card
    @productions = current_user.productions.order('created_at DESC').limit(8)
  end
end

