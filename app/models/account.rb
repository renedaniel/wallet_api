class Account < ApplicationRecord
  belongs_to :user
  #TODO more validations
  validates :account_number, presence: true
end
