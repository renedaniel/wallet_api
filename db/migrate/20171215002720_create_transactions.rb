class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.float :amount
      t.float :fixed_rate
      t.float :commission_amount
      t.float :commission_percent
      t.integer :account_id
      t.string :another_account

      t.timestamps
    end
  end
end
