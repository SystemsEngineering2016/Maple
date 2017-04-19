class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.string :Table_Name
      t.string :Column_Name
      t.string :Data_Type
      t.integer :Display_Width
      t.integer :Display_Height
      t.string :Display_Prompt
      t.string :Display_Short_Prompt
      t.text :Implementation_Comment
      t.references :version, foreign_key: true

      t.timestamps
    end


  end
end
