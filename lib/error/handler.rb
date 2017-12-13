module Error::Handler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActiveRecord::RecordNotFound do |e|
        respond(:record_not_found, 404, e.to_s)
      end
      rescue_from StandardError do |e|
        respond(:standard_error, 500, e.to_s)
      end
    end
  end

  private

  def respond(_error, _status, _message)
    render json: {
      status: _status,
      error: _error,
      message: _message,
    }.as_json
  end
end
