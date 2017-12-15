class User < ApplicationRecord
  #Auth
  has_secure_password
  #Relations
  belongs_to :rol, foreign_key: 'rol_id'
  has_one :account
  #Validations
  #TODO more validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def get_data()
    @account = self.account
    {
      id: self.id,
      first_name: self.first_name,
      last_name: self.last_name,
      email: self.email,
      account: {account_number: @account.account_number},
    }
  end
end
