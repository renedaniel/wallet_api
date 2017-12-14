class ErrorsController < ApplicationController
  def not_found
    render json: {
      status: 404,
      error: :not_found,
      message: 'El recurso no está disponible',
    }, status: 404
  end

  def internal_server_error
    render json: {
      status: 500,
      error: :internal_server_error,
      message: 'Ha ocurrido un problema con el servidor, inténtalo más tarde',
    }, status: 500
  end
end
