module Api::V1
  class CustomersController < ApplicationController
    def index
      @customers = Customer.all
      render json: @customers
    end
  end
end