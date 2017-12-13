class AddRolToRol < ActiveRecord::Migration[5.1]
  def change
    add_column :rols, :rol, :string
  end
end
