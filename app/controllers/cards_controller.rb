class CardsController < ApplicationController

  require "payjp"
  before_action :set_card

  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "new" if card.present?
  end

  def create
    Payjp.api_key = ENV['PAYJP_ACCESS_KEY']
    # binding.pry
    if params['payjp-token'].blank?
      puts "ok"
      # redirect_to action: "user"多分new
    else
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        email: current_user.email,
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id} # 無くてもOK。
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
