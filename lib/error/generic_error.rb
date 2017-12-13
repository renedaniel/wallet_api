module Error
  class GenericError < StandardError
    attr_reader :status, :errors, :message

    def initialize(errors = {}, message = 'Generic error')
      @errors = errors
      @status = 500
      @message = message
    end
  end
end
