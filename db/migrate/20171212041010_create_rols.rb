class CreateRols < ActiveRecord::Migration[5.1]
  def change
    create_table :rols do |t|
      t.string :rol_name

      t.timestamps
    end
  end
end
