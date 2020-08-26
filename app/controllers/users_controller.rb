class UsersController < ApplicationController
  def show
    @card = current_user.card
    @productions = current_user.productions.order('created_at DESC').limit(8)
  end
end

