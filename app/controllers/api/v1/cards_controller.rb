class Api::V1::CardsController < ApplicationController
  def create
    @card = Card.new(card_params)
    @card.user = User.find(user_params)
    raise Error::ValidationError.new(@card) unless @card.save
    @response = {success: true}
    render_success @response
  end

  def destroy
  end

  private

  def card_params
    params.require(:card).permit(:number, :full_name, :expiration, :cvc, :number_mask)
  end

  def user_params
    params.require(:user_id)
  end
end
