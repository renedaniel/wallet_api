module Error
  class ValidationError < StandardError
    attr_reader :status, :errors, :message

    def initialize(model = {}, message = 'Invalid data')
      @errors = {}
      puts model.errors.details
      model.errors.details.each do |field, err|
        @errors[field] = []
        err.each do |e|
          @errors[field] << "#{field}_#{e[:error]}_validation"
        end
      end

      @errors = errors
      @status = 500
      @message = message
    end
  end
end
