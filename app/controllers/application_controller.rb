class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Error::Handler
  #before_action :authenticate_user
end
