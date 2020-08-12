class ProductionsController < ApplicationController

  def index
  end

  def show
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
    currency: 'jpy',
    )
    redirect_to root_path, notice: "支払いが完了しました"
  end

  private


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
    ).merge(user_id: current_user.id)
  end
end
