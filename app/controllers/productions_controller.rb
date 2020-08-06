class ProductionsController < ApplicationController
  # def index
  #   @parents = Category.all.order("id ASC").limit(13)
  # end

  def index
    @parents = Category.where(ancestry: nil)
  end
end
