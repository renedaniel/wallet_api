class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :number
      t.string :full_name
      t.string :expiration
      t.string :cvc
      t.string :number_mask
      t.integer :user_id

      t.timestamps
    end
  end
end
