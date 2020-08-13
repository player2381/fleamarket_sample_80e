class CardsController < ApplicationController

  require "payjp"
  before_action :set_card

  def new
    
    @card = Card.new
    
  end

  def create
    
    Payjp.api_key = ENV['PAYJP_ACCESS_KEY']
    if params['payjp-token'].blank?
      
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to user_path(current_user.id)
        
      else
        redirect_to action: "new"
        
      end
    end
  end

  def destroy
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.delete
      redirect_to user_path(current_user.id)
    else
      redirect_to cards_path
    end
  end


  def show
    Payjp.api_key = ENV['PAYJP_ACCESS_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card = customer.cards.retrieve(@card.card_id)
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
