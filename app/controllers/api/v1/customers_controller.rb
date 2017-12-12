module Api::V1
  class CustomersController < ApplicationController
    before_action :authenticate_user

    def index
      @customers = Customer.all
      render json: @customers
    end

    def create
      @user = User.create(
          {
              first_name: params[:first_name],
              last_name: params[:last_name]
          })

      @user.rol = Rol.find_by_rol("c")

      @response = {
          success: @user.save,
          errors: @user.errors
      }
      render json: @response

    end
  end
end