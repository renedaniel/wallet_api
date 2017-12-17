class ChangeNamesTransactions < ActiveRecord::Migration[5.1]
  def change
    rename_column :transactions, :another_account, :bank_account
    remove_column :transactions, :account_id, :integer
    add_column :transactions, :account_number, :string
  end
end
