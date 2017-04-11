class AddColToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :Data_Point_Status, :string, :after => :Implementation_Comment

  end
end
