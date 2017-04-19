class RemoveDisplayHeightFromTableName < ActiveRecord::Migration[5.0]
  def change
    remove_column :tables, :Display_Height, :string
  end
end
