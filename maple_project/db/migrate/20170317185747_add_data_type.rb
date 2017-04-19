class AddDataType < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :Data_Type, :string, :after => :Column_Name
  end
end
