class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Error::Handler
  #before_action :authenticate_user

  protected

  def render_success(response = {}, status = 200)
    render json: {
      status: status,
      response: response,
    }
  end
end
