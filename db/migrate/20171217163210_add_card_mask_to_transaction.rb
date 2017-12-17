class AddCardMaskToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :card_mask, :string
  end
end
