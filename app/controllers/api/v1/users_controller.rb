module Api::V1
  class Api::V1::UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      @user.rol = Rol.find_by_rol("c")
      @account = Account.new({
        account_number: rand(10000..999999), #TODO better way to get this
        balance: 0,
      })
      @user.account = @account
      raise Error::ValidationError.new(@user) unless @user.save
      render_success @user
    end

    def login_user_from_jwt
      @decoded_token = JWT.decode jwt_params, Rails.application.secrets.secret_key_base, true, {:algorithm => 'HS256'}
      @user_id = @decoded_token[0]['sub']
      @user = User.find(@user_id).get_data
      render_success @user
    end

    def get_cards
      @user = User.new(user_id_params)
      render_success @user.cards
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
    end

    def jwt_params
      params.require(:jwt)
    end

    def user_id_params
      params.require(:user_id)
    end
  end
end
