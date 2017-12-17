class AddTotalToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :total, :float
    remove_column :transactions, :transaction_type, :string
    add_column :transactions, :transaction_type, :integer
  end
end
