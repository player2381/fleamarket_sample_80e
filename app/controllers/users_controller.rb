class UsersController < ApplicationController
  def show
    @card = current_user.card
  end
end
