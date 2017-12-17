require 'net/http'

class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate_user

  def deposit_to_account
    #ver el puto error
    @invalid_amount = Transaction.invalid_amount?('ppp')
    raise Error::ValidationError.new(@invalid_amount) unless !@invalid_amount
    @data_to_transaction = Transaction.get_data_for_account_transaction(deposit_to_account_params)
    @payment_success = pay_api_transaction(@data_to_transaction[:card])
    raise Error::ValidationError.new(@payment_success) unless @payment_success[:success]

    @transaction_type = TransactionType.find_by_transaction_type('d')
    @transaction = Transaction.new({
      amount: @data_to_transaction[:quantites][:amount],
      commission_amount: @data_to_transaction[:quantites][:commission_amount],
      commission_percent: @data_to_transaction[:quantites][:commission_percent],
      fixed_rate: @data_to_transaction[:quantites][:fixed_rate],
      total: @data_to_transaction[:quantites][:total],
      transaction_type: @transaction_type.name,
      account_number: @data_to_transaction[:account][:account_number],
      card_mask: @data_to_transaction[:card][:number_mask],
    })

    @transaction.user = @data_to_transaction[:user]
    raise Error::ValidationError.new(@transaction) unless @transaction.save
    @response = {
      success: true,
    }
    render_success @response
  end

  def get_transactions
    @user = User.get_user_from_jwt(jwt_params)
    @response = {
      transactions: @user.transactions,
    }
    render_success @response
  end

  private

  def deposit_to_account_params
    params.require(:data).permit(:card_id, :amount)
  end

  def pay_api_transaction(card)
    uri = URI.parse('https://gateway.com/payment/')
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri)
    #Fake response
    {
      success: true,
    }
  end
end
