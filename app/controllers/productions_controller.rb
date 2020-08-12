class ProductionsController < ApplicationController
  # require 'payjp'
  
  # before_action :set_production, only: [:show, :purchase, :pay]

  def index
    # @production = Production.order('id DESK').limit(4)
  end

  def show
  end

  def new
    # @production = Production.new
    # @production.production_images.build
    # @production.build_shipping
  end

  def create
    # @production = Production.new(production_params)
    # if @production.save
    #   redirect_to action: :index
    # end
  end

  def pay
    # @production = Production.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @production.price,
    card: params['payjp-token'],
    currency: 'jpy',
    )
    # redirect_to root_path, notice: "支払いが完了しました"
  end

  private

  # def set_production
  #   @production = Production.find(params[:id])
  # end

  def production_params
    params.require(:production).permit(
      :name,
      :price,
      :introduction,
      :size,
      :shipping_charge,
      :prefecture_code,
      :detail_date,
      :trading_status,
      #この辺の他コードは関係ない部分なので省略してます
    ).merge(user_id: current_user.id)
  end
end
