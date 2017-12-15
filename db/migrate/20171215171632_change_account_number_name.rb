class ChangeAccountNumberName < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :number, :account_number
    add_column :accounts, :user_id, :integer
  end
end
