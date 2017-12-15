module Encryptor
  class Handler
    def self.decrypt(secret = "")
      decrypt secret
    end

    def self.encrypt(secret = "")
      encrypt secret
    end

    def self.get_decrypted_object(object = {})
      @decrypted = {}
      object.each do |field, secret|
        if !secret.nil? && secret.length > 0
          @decrypted["#{field}"] = decrypt(secret)
        else
          @decrypted["#{field}"] = ""
        end
      end
      @decrypted
    end

    private

    def self.decrypt(secret)
      private_key = OpenSSL::PKey::RSA.new(Base64.decode64(Rails.application.secrets.private_key))
      private_key.private_decrypt(Base64.decode64(secret))
    end

    def self.encrypt(secret)
      public_key = OpenSSL::PKey::RSA.new(Base64.decode64(Rails.application.secrets.public_key))
      encrypted = Base64.encode64(public_key.public_encrypt(secret))
    end
  end
end
