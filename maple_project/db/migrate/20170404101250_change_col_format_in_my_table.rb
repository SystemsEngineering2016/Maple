class ChangeColFormatInMyTable < ActiveRecord::Migration[5.0]
  def change
    change_column :tables, :Column_Name, :string

  end
end
