module Encryptor
  class Handler
    def self.get_secret(secret = "")
      decode secret
    end

    private

    def self.decode(secret)
      private_key = OpenSSL::PKey::RSA.new(Base64.decode64(Rails.application.secrets.private_key))
      private_key.private_decrypt(Base64.decode64(secret))
    end
  end
end
