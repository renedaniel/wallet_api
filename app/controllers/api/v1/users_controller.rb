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
      @token = Knock::AuthToken.new(payload: {sub: @user.id}).token
      @response = {
        jwt: @token,
      }
      render_success @response
    end

    def login_user_from_jwt
      @user = User.get_user_from_jwt(jwt_params)
      render_success @user.get_data
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
    end

    def jwt_params
      params.require(:jwt)
    end
  end
end
