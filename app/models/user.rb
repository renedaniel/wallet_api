class User < ApplicationRecord
  #Auth
  has_secure_password
  #Relations
  belongs_to :rol, foreign_key: 'rol_id'
  has_one :account
  has_many :cards
  has_many :transactions
  #Validations
  #TODO more validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.get_user_from_jwt(jwt)
    @decoded_token = JWT.decode jwt, Rails.application.secrets.secret_key_base, true, {:algorithm => 'HS256'}
    @user_id = @decoded_token[0]['sub']
    User.find(@user_id)
  end

  def get_data
    @account = self.account
    #TODO self.cards How to filter data ??? or look for join
    @cards = Card.where("user_id = ?", self.id).select('id, number_mask')
    {
      first_name: self.first_name,
      last_name: self.last_name,
      email: self.email,
      account: {
        balance: @account.balance,
        account_number: @account.account_number,
      },
      cards: @cards,
    }
  end
end
