class ChangeCardNumberName < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :number, :card_number
  end
end
