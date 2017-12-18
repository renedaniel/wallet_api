module Error
  class TransactionError < StandardError
    attr_reader :status, :errors, :message

    def initialize(errors = {}, message = 'Invalid data')
      @errors = {}
      errors.each do |field, err|
        @errors[field] = []
        err.each do |e|
          @errors[field] << "#{field}_#{e[:error]}_validation"
        end
      end

      @errors = @errors
      @status = 500
      @message = message
    end
  end
end
