class ProductionsController < ApplicationController
  
  def index
    
  end

  def new
  end

  def create
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @production.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end

  def production_params
    params.require(:production).permit(
      :name,
      :text,
      :price,
      #この辺の他コードは関係ない部分なので省略してます
    ).merge(user_id: current_user.id)
  end
end
