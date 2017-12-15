class Card < ApplicationRecord
  belongs_to :user
  before_validation :decrypt_secrets
  before_save :secure_data
  #TODO more validations
  validates :card_number, presence: true
  validates :full_name, presence: true
  validates :expiration, presence: true
  validates :cvc, presence: true

  protected

  def encrypt(secret)
    Encryptor::Handler.encrypt(secret)
  end

  def decrypt(secret)
    Encryptor::Handler.decrypt(secret)
  end

  private

  def decrypt_secrets
    self.card_number = self.decrypt(self.card_number) if self.card_number.length > 0
    self.full_name = self.decrypt(self.full_name) if self.full_name.length > 0
    self.expiration = self.decrypt(self.expiration) if self.expiration.length > 0
    self.cvc = self.decrypt(self.cvc) if self.cvc.length > 0
  end

  def secure_data
    self.number_mask = self.card_number[self.card_number.length - 4..self.card_number.length]
    self.card_number = self.encrypt(self.card_number)
    self.full_name = self.encrypt(self.full_name)
    self.expiration = self.encrypt(self.expiration)
    self.cvc = self.encrypt(self.cvc)
  end
end
