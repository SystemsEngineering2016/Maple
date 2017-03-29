class RenameLongestname < ActiveRecord::Migration[5.0]
  def change
    rename_column :tables, :Longest_Name, :Logical_Name
  end
end
