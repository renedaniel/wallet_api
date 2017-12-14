module Api::V1
  class Api::V1::UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      @user.rol = Rol.find_by_rol("c")
      raise Error::ValidationError.new(@user) unless @user.save
      render_success @user
    end

    def get_user_from_jwt
      @decoded_token = JWT.decode jwt_params, Rails.application.secrets.secret_key_base, true, {:algorithm => 'HS256'}
      @user_id = @decoded_token[0]['sub']
      @user = User.find(@user_id)
      render_success @user
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
