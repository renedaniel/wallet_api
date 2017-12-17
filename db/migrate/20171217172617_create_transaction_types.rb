class CreateTransactionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_types do |t|
      t.string :name
      t.string :transaction_type

      t.timestamps
    end
  end
end
