class RenameColumnToNew < ActiveRecord::Migration[5.0]
  def change
    rename_column :tables, :Table_Name, :Longest_Name
    rename_column :tables, :Column_Name, :Short_Name
    rename_column :tables, :Data_Type, :Table_Name
    rename_column :tables, :Display_Width, :Column_Name
    rename_column :tables, :Display_Height, :Display_Width
    rename_column :tables, :Display_Prompt, :Display_Height
    rename_column :tables, :Display_Short_Prompt, :Display_Prompt






  end
end
