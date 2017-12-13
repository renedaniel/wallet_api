module Api::V1
  class Api::V1::UsersController < ApplicationController
    def create
      @user = User.new({
        first_name: params[:first_name],
        last_name: params[:last_name],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        email: params[:email],
      })
      @user.rol = Rol.find_by_rol("c")
      raise Error::ValidationError.new(@user) unless @user.save
      render json: {
        status: 200,
        response: @user,
      }
    end
  end
end
