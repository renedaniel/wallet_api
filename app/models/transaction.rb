class Transaction < ApplicationRecord
  belongs_to :user
  after_save :save_money

  validates :amount, presence: true, numericality: true
  validates :commission_amount, presence: true, numericality: true
  validates :commission_percent, presence: true, numericality: true
  validates :fixed_rate, presence: true, numericality: true
  validates :total, presence: true, numericality: true
  validates :transaction_type, presence: true
  validates :bank_account, length: {is: 18}, allow_blank: true

  def self.get_data_for_account_transaction(data)
    @card = Card.get_decrypted(data[:card_id])
    @amount = Encryptor::Handler.decrypt(data[:amount])
    @user = User.find(@card.user_id)
    {
      card: @card,
      quantites: calcQuantities(@amount.to_f),
      account: @user.account,
      user: @user,
    }
  end

  def self.get_data_for_withdraw(data, jwt)
    @amount = Encryptor::Handler.decrypt(data[:amount])
    @user = User.get_user_from_jwt(jwt)
    {
      quantites: calcQuantities(@amount.to_f),
      bank_account: Encryptor::Handler.decrypt(data[:bank_account]),
      user: @user,
    }
  end

  def self.get_data_for_transfer(data, jwt)
    @amount = Encryptor::Handler.decrypt(data[:amount])
    @user = User.get_user_from_jwt(jwt)
    {
      quantites: calcQuantities(@amount.to_f),
      account_number: Encryptor::Handler.decrypt(data[:account_number]),
      user: @user,
    }
  end

  def self.is_invalid_deposit?(data, jwt)
    @amount = Encryptor::Handler.decrypt(data[:amount])
    @card_id = Encryptor::Handler.decrypt(data[:card_id])
    #TODO improve this
    @t = Transaction.new({amount: @amount})
    @t.valid?
    @errors = @t.errors.details.slice(:amount)
    return @errors unless @errors.length == 0
    @card = Card.find(@card_id)
    @not_found_error = {
      card_id: [{error: "card_not_found", value: "Invalid"}],
    }
    return @not_found_error unless @account
    false
  end

  def self.is_invalid_withdraw?(data, jwt)
    @amount = Encryptor::Handler.decrypt(data[:amount])
    @bank_account = Encryptor::Handler.decrypt(data[:bank_account])
    #TODO improve this
    @t = Transaction.new({amount: @amount, bank_account: @bank_account})
    @t.valid?
    @errors = @t.errors.details.slice(:amount, :bank_account)
    return @errors unless @errors.length == 0
    @user = User.get_user_from_jwt(jwt)
    @balance = @user.account.balance
    @quantites = calcQuantities(@amount.to_f)
    return false unless @quantites[:total] > @balance
    {
      amount: [{error: "balance_not_enough", value: "Invalid"}],
    }
  end

  def self.is_invalid_transfer?(data, jwt)
    @amount = Encryptor::Handler.decrypt(data[:amount])
    @account_number = Encryptor::Handler.decrypt(data[:account_number])
    #TODO improve this
    @t = Transaction.new({amount: @amount, account_number: @account_number})
    @t.valid?
    @errors = @t.errors.details.slice(:amount, :account_number)
    return @errors unless @errors.length == 0
    @user = User.get_user_from_jwt(jwt)
    @balance = @user.account.balance
    @quantites = calcQuantities(@amount.to_f)
    @balance_error = {
      amount: [{error: "balance_not_enough", value: "Invalid"}],
    }
    return @balance_error unless @quantites[:total] < @balance
    @account = Account.find_by_account_number(@account_number)
    @not_found_error = {
      account_number: [{error: "account_not_found", value: "Invalid"}],
    }
    return @not_found_error unless @account
    false
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
