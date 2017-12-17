class ChangeNamesTransactionsType < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :transaction_type, :integer
    add_column :transactions, :transaction_type, :string
  end
end
