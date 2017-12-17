class Transaction < ApplicationRecord
  belongs_to :user
  after_save :save_money

  validates :amount, presence: true, numericality: true
  validates :commission_amount, presence: true, numericality: true
  validates :commission_percent, presence: true, numericality: true
  validates :fixed_rate, presence: true, numericality: true
  validates :total, presence: true, numericality: true
  validates :transaction_type, presence: true
  validates :card_mask, presence: true

  def self.get_data_for_account_transaction(data)
    @card = Card.get_decrypted(data[:card_id])
    @amount = Encryptor::Handler.decrypt(data[:amount])
    @user = User.find(@card.user_id)
    {
      card: @card,
      quantites: self.calcQuantities(@amount.to_f),
      account: @user.account,
      user: @user,
    }
  end

  def self.invalid_amount?(amount)
    #TODO, make this reusable
    @t = Transaction.new({amount: amount})
    @t.valid?
    @errors = @t.errors[:amount]
    return false unless @errors.length > 0
    {
      amount: @errors,
    }
  end

  private

  def save_money
    #TODO Save earnings
    @admin_rol = Rol.find_by_rol("a")
    @master_user = User.find_by_rol_id(@admin_rol.id)
    #@master_account = @master_user.account
    #Save new user balance
    @user_account = User.find(self.user_id).account
    @new_user_balance = self.amount + @user_account.balance
    @user_account.update_attributes({balance: @new_user_balance})
  end

  def self.calcQuantities(amount)
    @fixed_rate = 0
    @commission = 0
    @commission_percent = 0
    if (amount <= 1000)
      @fixed_rate = 8
      @commission_percent = 0.03
      @commission = amount * @commission_percent
    elsif (amount > 1000 && amount <= 5000)
      @fixed_rate = 6
      @commission_percent = 0.025
      @commission = amount * @commission_percent
    elsif (amount > 5000 && amount <= 10000)
      @fixed_rate = 4
      @commission_percent = 0.02
      @commission = amount * @commission_percent
    elsif (amount > 10000)
      @fixed_rate = 3
      @commission_percent = 0.01
      @commission = amount * @commission_percent
    end
    @total = amount + @commission + @fixed_rate
    {
      amount: amount,
      commission_amount: @commission,
      fixed_rate: @fixed_rate,
      total: @total,
      commission_percent: @commission_percent,
    }
  end
end
