class Api::V1::CardsController < ApplicationController
  before_action :authenticate_user

  def create
    @card = Card.new(card_params)
    @card.user = User.get_user_from_jwt(jwt_params)
    raise Error::ValidationError.new(@card) unless @card.save
    @response = {
      id: @card.id,
      number_mask: @card.number_mask,
    }
    render_success @response
  end

  def destroy
  end

  private

  def card_params
    params.require(:card).permit(:card_number, :full_name, :expiration, :cvc)
  end

  def jwt_params
    params.require(:jwt)
  end
end
