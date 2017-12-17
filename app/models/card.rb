class Card < ApplicationRecord
  belongs_to :user
  before_validation :decrypt_secrets
  before_save :secure_data
  #TODO more validations
  validates :card_number, presence: true, numericality: true, length: {is: 16} #TODO check for uniqueness decrypt
  validates :full_name, presence: true
  validates :expiration, presence: true, length: {is: 4}
  validates :cvc, presence: true, length: {is: 3}

  def self.get_decrypted(card_id)
    #TODO, look for a better way to do this
    @card = self.find(self.decrypt(card_id))
    @card.card_number = self.decrypt(@card.card_number)
    @card.full_name = self.decrypt(@card.full_name)
    @card.expiration = self.decrypt(@card.expiration)
    @card.cvc = self.decrypt(@card.cvc)
    @card
  end

  def self.encrypt(secret)
    Encryptor::Handler.encrypt(secret)
  end

  def self.decrypt(secret)
    Encryptor::Handler.decrypt(secret)
  end

  private

  def decrypt_secrets
    self.card_number = Card.decrypt(self.card_number) if self.card_number.length > 0
    self.full_name = Card.decrypt(self.full_name) if self.full_name.length > 0
    self.expiration = Card.decrypt(self.expiration) if self.expiration.length > 0
    self.cvc = Card.decrypt(self.cvc) if self.cvc.length > 0
  end

  def secure_data
    self.number_mask = self.card_number[self.card_number.length - 4..self.card_number.length]
    self.card_number = Card.encrypt(self.card_number)
    self.full_name = Card.encrypt(self.full_name)
    self.expiration = Card.encrypt(self.expiration)
    self.cvc = Card.encrypt(self.cvc)
  end
end
