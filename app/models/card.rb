class Card < ApplicationRecord
  belongs_to :user
  #TODO more validations
  validates :number, presence: true
  validates :full_name, presence: true
  validates :expiration, presence: true
  validates :cvc, presence: true
  validates :number_mask, presence: true
end
