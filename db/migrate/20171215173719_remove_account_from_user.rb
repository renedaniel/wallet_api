class RemoveAccountFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :account_id, :integer
  end
end
