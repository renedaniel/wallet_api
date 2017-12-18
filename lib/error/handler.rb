module Error::Handler
  def self.included(clazz)
    puts clazz
    clazz.class_eval do
      rescue_from ActiveRecord::RecordNotFound do |e|
        respond(:record_not_found, 500, e.to_s)
      end
      rescue_from StandardError do |e|
        puts e
        respond(:standard_error, 500, e.to_s)
      end
      rescue_from GenericError do |e|
        respond(e.errors, e.status, e.message)
      end
      rescue_from ValidationError do |e|
        respond(e.errors, e.status, e.message)
      end
      rescue_from TransactionError do |e|
        respond(e.errors, e.status, e.message)
      end
    end
  end

  private

  def respond(_error, _status, _message)
    render json: {
      status: _status,
      errors: _error,
      message: _message,
    }.as_json
  end
end
